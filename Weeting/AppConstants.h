//
//  AppConstants.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppConstants : NSObject

+ (NSString *) getBaseUrl;
+ (NSString *) getAppInforPlist;

+ (BOOL) isLogin;
+ (void) setLoginTrue;

+ (NSString *) getDeviceId;
+ (void) setDeviceId: (NSString *) deviceid;

+ (NSDictionary *) getPlistDictionary;
+ (void) setPlistValue: (NSString *) key value:(NSObject *) v;

+ (NSString *) getAppScheme;    // html내에서 스키마 설정
@end
