

#import <UIKit/UIKit.h>
#define CurrentVc        [ViewControllerHelper currentViewController]
@interface ViewControllerHelper : NSObject

/// 获取当前的ViewController
+ (UIViewController *)currentViewController;

/// 获取当前的NavigationController
+ (UINavigationController *)currentNavigationController;

@end
