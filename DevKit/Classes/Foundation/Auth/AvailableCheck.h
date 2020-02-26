//
//  AvailableCheck.h
//  DeveloperTool
//
//  Created by du on 6/6/18.
//  Copyright © 2018年 du. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 权限检测
 */
@interface AvailableCheck : NSObject

/// 检测相册权限
+ (void)checkAlbumAuth:(void (^)(BOOL auth))result ;

/// 检测相机权限
+ (void)checkCameraAuth:(void (^)(BOOL auth))result;

/// 跳转到系统设置
+ (void)toSystemSettingPage;

@end
