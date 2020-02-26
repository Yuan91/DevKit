//
//  NSData+Utils.m
//  anb
//
//  Created by du on 2018/12/18.
//  Copyright © 2018 alpha. All rights reserved.
//

#import "NSData+XXUtils.h"

@implementation NSData (XXUtils)

/**
 Data转16进制字符串
 */
- (NSString *)xx_toHexString{
    const unsigned char *dataBuffer = (const unsigned char*)[self bytes];
    if(!dataBuffer){
        return nil;
    }
    NSUInteger dataLength = [self length];
    NSMutableString* hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    for(int i = 0; i < dataLength; i++){
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    }
    NSString* result = [NSString stringWithString:hexString];
    return result;
}

/**
 Data转string
 */
- (NSString *)xx_toString{
    NSString *str = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    return str;
}

/**
 转字典
 */
- (NSDictionary *)xx_toDictionary{
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers |NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&error];
    if (error == nil) {
        return dic;
    }
    return nil;
}

@end
