//
//  NSString+Utils.h
//  anb
//
//  Created by du on 2018/12/18.
//  Copyright © 2018 alpha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XXUtils)

/**
 转Data.
 NSUTF8StringEncoding 编码
 */
- (NSData *)xx_toData;


/**
 转16进制data
 */
-(NSData*)xx_toHexData;

/**
 复制文本到剪贴板
 */
- (void)xx_copyToPasteboard;

/**
 转字典
 */
- (NSDictionary *)xx_toDictionary;



/**
 移除0x前缀
 */
- (NSString *)xx_remove0x;

@end


