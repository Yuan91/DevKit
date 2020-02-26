

#import "ViewControllerHelper.h"

@implementation ViewControllerHelper
+ (UIViewController *) findViewController: (Class)viewControllerClass {
    return [self findViewController: viewControllerClass
                                 vc: [UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *) currentViewController {
    // Find best view controller
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (!viewController) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        if (windows.count > 0) {
            UIWindow *currentWindow = windows[0];
            viewController = currentWindow.rootViewController;
        }
        
    }
    return [self findBestViewController: viewController];
}

+ (UINavigationController *) currentNavigationController {
    UIViewController *viewController = [self currentViewController];
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    do {
        if ([viewController isKindOfClass: [UINavigationController class]]) {
            return (UINavigationController *) viewController;
        } else {
            viewController = viewController.parentViewController;
        }
    } while (viewController != nil && viewController != rootViewController);
    return nil;
}

+ (UIViewController *) findViewController: (Class)viewControllerClass
                                       vc: (UIViewController *)vc{
    if (vc.presentedViewController) {
        // Return presented view controller
        if ([vc isKindOfClass: viewControllerClass]) {
            return vc;
        } else {
            return [self findViewController: viewControllerClass
                                         vc: vc.presentedViewController];
        }
    } else if ([vc isKindOfClass: [UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findViewController: viewControllerClass
                                         vc: svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findViewController: viewControllerClass
                                         vc: svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass: [UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findViewController: viewControllerClass
                                         vc: svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return [vc isKindOfClass: viewControllerClass] ? vc : nil;
    }
}

+ (UIViewController *) findBestViewController: (UIViewController *)vc {
    if (vc.presentedViewController) {
        // Return presented view controller
        return [self findBestViewController: vc.presentedViewController];
    } else if ([vc isKindOfClass: [UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController: svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController: svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass: [UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController: svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}

@end

