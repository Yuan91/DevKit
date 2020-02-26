//
//  ButtonFactory.h
//  MTEx
//
//  Created by du on 2019/8/7.
//  Copyright © 2019 alpha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ActionBlock)(void);

typedef NS_ENUM(NSInteger,ButtonType) {
    //图片在左,文字在右
    ButtonTypeNormal = 0,
    //图片在右,文字在左
    ButtonTypeImageRight = 1,
    //图片在上,文字在下
    ButtonTypeImageTop = 2,
    //图片在下,文字在上
    ButtonTypeImageBottom = 3
};

@interface BlockButton : UIButton

///调整 Button 文字和图片布局,适用文字和图片延迟加载的情况
- (void)refreshLayout;

@end

/// 快速创建button
@interface ButtonFactory : NSObject

/// 纯文本按钮
+ (UIButton *)textButton:(NSString *)text
                   block:(ActionBlock)block;

/// 图片按钮
+ (UIButton *)imageButton:(NSString *)imageName
                    block:(ActionBlock)block;


/// 图文混排按钮
/// @param title tile
/// @param imageName image
/// @param type 按钮类型
/// @param gap 文字和图片间距
/// @param block 回调
+ (BlockButton *)buttonWithTitle:(NSString *)title
                        image:(NSString *)imageName
                         type:(ButtonType)type
                          gap:(CGFloat)gap
                        block:(ActionBlock)block;


@end

NS_ASSUME_NONNULL_END
