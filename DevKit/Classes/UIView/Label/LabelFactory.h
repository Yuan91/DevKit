//
//  LabelFactory.h
//  DeveloperTool
//
//  Created by du on 2017/9/12.
//  Copyright © 2017年 du. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 快速创建Label
@interface LabelFactory : NSObject

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;

@end


