//
//  AppConstants.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "AppConstants.h"

@implementation AppConstants

+ (NSString *) getBaseUrl{
    return @"http://localhost:8080/WeetingServer";
}

+ (NSString *) getAppInforPlist
{
    return @"appPlist";
}

+ (BOOL) isLogin
{
    /* 로그인 요청에 대한 전처리가 필요하다.
     만일 앱을 처음 깔거나 로그아웃을 한 경우에는 아이디, 패스워드 로그인을 요청해야한다
     그런 경우가 아니라면 디바이스 아이디 로그인을 요청하여 사용자 입력없이 바로 로그인이 되게한다.
     둘을 구분하는것은 plist를 통해 구현해야 할 것이다.
     */
    // 만일 참이라면 로그인상태이므로 디바이스 아이디 로그인 요청
    // 거짓이라면 로그아웃상태이거나 처음 설치한 상태이므로 아이디 패스워드 로그인 요청
    BOOL login = [[[AppConstants getPlistDictionary] objectForKey:@"login"] boolValue];
    
    return login;
}

+ (void) setLoginTrue
{
    [self setPlistValue:@"login" value:[NSNumber numberWithBool:YES]];
}

+ (NSString *) getDeviceId
{
    return (NSString *) [[AppConstants getPlistDictionary] objectForKey:@"deviceid"];
}

+ (void) setDeviceId: (NSString *) deviceid{
    [self setPlistValue:deviceid value:@"deviceid"];
}

+ (NSDictionary *) getPlistDictionary {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:[AppConstants getAppInforPlist] ofType:@"plist"];
    NSDictionary *lists = [NSDictionary dictionaryWithContentsOfFile:plistPath ];
    return lists;
}

+ (NSObject *) getPlistValue: (NSString *) key {
    return [[AppConstants getPlistDictionary] objectForKey:key];
}

+ (void) setPlistValue: (NSString *) key value:(NSObject *) v{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:[AppConstants getAppInforPlist] ofType:@"plist"];
    NSMutableDictionary *lists = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    
    [lists setValue:v forKey:key];
    
    [lists writeToFile:plistPath atomically:YES];
}

+ (NSString *) getAppScheme{
    return @"app";
}
@end
