//
//  UIViewController+Alert.h
//  anb
//
//  Created by du on 23/5/18.
//  Copyright © 2018年 alpha. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^XXAlertBlock)(NSInteger index);

/**
 在当前ViewController 快速弹出 ActionSheet/Alert
 使用 UIAlertController 实现
 */
@interface UIViewController (XXAlert)


/// 弹出ActionSheet
/// @param title tile
/// @param message message
/// @param cancelTitle cancelTitle
/// @param actionArray actionTitle
/// @param block callback
- (void)xx_showActionSheet:(NSString *)title
                   message:(NSString *)message
               cancelTitle:(NSString *)cancelTitle
               actionArray:(NSArray <NSString *> *)actionArray
              clickAtIndex:(XXAlertBlock)block;


/// 弹出Alert
/// @param title title
/// @param message message
/// @param actionArray actionTitle
/// @param block callback
- (void)xx_showAlert:(NSString *)title
             message:(NSString *)message
         actionArray:(NSArray <NSString *> *)actionArray
        clickAtIndex:(XXAlertBlock)block;


@end
