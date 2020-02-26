#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CoreMacros.h"
#import "DevKitHeader.h"
#import "AvailableCheck.h"
#import "NSData+XXUtils.h"
#import "NSDictionary+XXUtils.h"
#import "NSObject+XXRuntime.h"
#import "NSString+XXNumber.h"
#import "NSString+XXUtils.h"
#import "GCDTimerManager.h"
#import "ButtonFactory.h"
#import "UIButton+XXMultiTouch.h"
#import "LabelFactory.h"
#import "UILabel+XXAddition.h"
#import "UITableView+XXPlaceholder.h"
#import "UIViewController+XXAlert.h"
#import "ViewControllerHelper.h"

FOUNDATION_EXPORT double DevKitVersionNumber;
FOUNDATION_EXPORT const unsigned char DevKitVersionString[];

