//
//  UIButton+XXMultiTouch.h
//  anb
//
//  Created by du on 31/7/18.
//  Copyright © 2018年 alpha. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 runtime 实现禁止UIButton 连续点击
 */
@interface UIButton (XXMultiTouch)
/// 禁止UIButton连续点击. 默认不禁止,即允许按钮连续点击
@property (nonatomic,assign) BOOL xx_disableMultiTouch;
/// 允许连续点击的时间间隔.默认是1s
@property (nonatomic,assign) NSTimeInterval xx_timeInterval;
@end
