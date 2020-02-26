//
//  NSData+Utils.h
//  anb
//
//  Created by du on 2018/12/18.
//  Copyright © 2018 alpha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (XXUtils)

/**
 Data转16进制字符串
 */
- (NSString *)xx_toHexString;

/**
 Data转string.
 UTF8StringEncoding
 */
- (NSString *)xx_toString;

/**
 转字典
 */
- (NSDictionary *)xx_toDictionary;

@end


