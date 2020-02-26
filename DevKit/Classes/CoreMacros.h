//
//  CoreMacros.h
//  DeveloperTool
//
//  Created by du on 2019/2/22.
//  Copyright © 2019 du. All rights reserved.
//

#ifndef CoreMacros_h
#define CoreMacros_h

/// 颜色
#define UIColorFromHex(hexString)                                               \
[UIColor colorWithRed:((float) ((hexString & 0xFF0000) >> 16)) / 255.0      \
green:((float) ((hexString & 0x00FF00) >> 8)) / 255.0       \
blue:((float) ((hexString & 0x0000FF) >> 0)) / 255.0       \
alpha:1.0]

#define UIColorFromRGBA(hexString,a)                                       \
[UIColor colorWithRed:((float) ((hexString & 0xFF0000) >> 16)) / 255.0      \
green:((float) ((hexString & 0x00FF00) >> 8)) / 255.0       \
blue:((float) ((hexString & 0x0000FF) >> 0)) / 255.0       \
alpha:a]


///  尺寸
#define SCREEN_SCALE    [UIScreen mainScreen].scale
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define STATUSANDBARHEIGHT  \
([UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height)
#define STATUSBAR_WIDTH     [[UIApplication sharedApplication] statusBarFrame].size.width
#define STATUSBAR_HEIGHT    [[UIApplication sharedApplication] statusBarFrame].size.height
#define TABBARHEIGHT    [[UITabBarController alloc]init].tabBar.frame.size.height

#define SCREEN_4S_WIDTH 320
#define SCREEN_5_WIDTH  320
#define SCREEN_6_WIDTH  375
#define SCREEN_6P_WIDTH 414

#define SCREEN_4S_HEIGHT 480
#define SCREEN_5_HEIGTH 568
#define SCREEN_6_HEIGHT 667
#define SCREEN_6P_HEIGHT 736
#define SCREEN_X_HEIGHT 812

///按屏幕比例计算高度,以 iphone6 为基准
#define SCALE_HEIGHT(currentHeight)     (SCREEN_HEIGHT / SCREEN_6_HEIGHT * currentHeight)
///按屏幕比例计算宽度,以 iphone6 为基准
#define SCALE_WIDTH(currentWidth)       (SCREEN_WIDTH / SCREEN_6_WIDTH * currentWidth)
///计算图片在不同屏幕的高度
#define SCALE_IMAGE(currentScreenWidth,imageSize)       (currentScreenWidth * imageSize.height / imageSize.width)


///空的判断
#define A_IS_STR_NIL(objStr)                                                 \
(![objStr isKindOfClass:[NSString class]] || objStr == nil ||              \
[objStr length] <= 0)
#define A_IS_DICT_NIL(objDict)                                               \
(![objDict isKindOfClass:[NSDictionary class]] || objDict == nil ||        \
[objDict count] <= 0)
#define A_IS_ARRAY_NIL(objArray)                                             \
(![objArray isKindOfClass:[NSArray class]] || objArray == nil ||           \
[objArray count] <= 0)
#define A_IS_NUM_NIL(objNum)                                                 \
(![objNum isKindOfClass:[NSNumber class]] || objNum == nil)
#define A_IS_DATA_NIL(objData)                                               \
(![objData isKindOfClass:[NSData class]] || objData == nil ||              \
[objData length] <= 0)
#define A_IS_OBJC_NIL(obj)     (obj == nil || [obj isKindOfClass:[NSNull class]])


#define CHECK_STRING(str) A_IS_STR_NIL(str) ? @"" : str

/// 字体
#define SYSTEM_FONT(SIZE)       [UIFont systemFontOfSize:SIZE]
#define BOLD_SYSTEM_FONT(SIZE)      [UIFont boldSystemFontOfSize:SIZE]


/// 判断系统版本大小
#define SYSTEM_VERSION_EQUAL_TO(v)                                             \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)                                         \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)                             \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                                            \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)                                \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] != NSOrderedDescending)


///工具
#define IS_IPHONE_X_STYLE   (STATUSBAR_HEIGHT > 20)
#define SafeAreaBottomHeight (IS_IPHONE_X_STYLE ? 34 : 0)
#define SafeAreaTopHeight (IS_IPHONE_X_STYLE ? 44 : 0)


///
#define App_Name [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleName"]

#endif /* CoreMacros_h */
