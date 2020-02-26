//
//  LabelFactory.m
//  DeveloperTool
//
//  Created by du on 2017/9/12.
//  Copyright © 2017年 du. All rights reserved.
//

#import "LabelFactory.h"


@implementation LabelFactory

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.text = text;
    label.numberOfLines = 0;
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

@end
