//
//  NSObject+XXRuntime.h
//  XXTableViewPlaceholderView
//
//  Created by du on 2017/11/29.
//  Copyright © 2017年 du. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XXRuntime)

+ (void)xx_swizzleInstanceMethod:(SEL)originalSel andMethod:(SEL)swizzleSel;

@end
