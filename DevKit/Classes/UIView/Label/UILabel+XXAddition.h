//
//  UILabel+AttributeText.h
//  anb
//
//  Created by du on 2018/4/26.
//  Copyright © 2018年 alpha. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 设置label 富文本
@interface UILabel (XXAddition)

///设置属性
- (void)addAttributes:(NSDictionary<NSString *, id> *)attributes
              forText:(NSString *)text;

///设置属性
- (void)addAttributes:(NSDictionary<NSString *, id> *)attributes
              forText:(NSString *)text
              options:(NSStringCompareOptions)options;

///行间距
- (void)setLineSpace:(CGFloat)space;

///添加下划线
- (void)addUnderLineForText:(NSString *)text;

///获取在限定宽度下label的高度
- (CGFloat)labelHeightWithWidth:(CGFloat)width;

///获取在限定高度下label的宽度
- (CGFloat)labelWidthWithHeight:(CGFloat)height;




@end
