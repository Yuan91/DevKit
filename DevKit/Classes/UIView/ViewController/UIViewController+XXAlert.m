//
//  UIViewController+Alert.m
//  anb
//
//  Created by du on 23/5/18.
//  Copyright © 2018年 alpha. All rights reserved.
//

#import "UIViewController+XXAlert.h"

@implementation UIViewController (XXAlert)


- (void)xx_showActionSheet:(NSString *)title
                   message:(NSString *)message
               cancelTitle:(NSString *)cancelTitle
               actionArray:(NSArray <NSString *> *)actionArray
              clickAtIndex:(XXAlertBlock)block{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < actionArray.count; i ++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionArray[i]
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
            if (block) {
                block(i);
            }
        }];
        [alert addAction:action];
    }
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:NULL];
}


- (void)xx_showAlert:(NSString *)title
             message:(NSString *)message
         actionArray:(NSArray <NSString *> *)actionArray
        clickAtIndex:(XXAlertBlock)block{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < actionArray.count; i ++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionArray[i]
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
            if (block) {
                block(i);
            }
        }];
        [alert addAction:action];
    }
    
    [self presentViewController:alert animated:YES completion:NULL];
}

@end
