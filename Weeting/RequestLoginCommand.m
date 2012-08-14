//
//  RequestLoginCommand.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "RequestLoginCommand.h"
#import "AppConstants.h"
#import "XmlUnmarshaller.h"
#import "UserSession.h"

@implementation RequestLoginCommand
@synthesize userid, password, deviceid;

- (id) initWithIdAndPassword:(NSString *)uid userpass:(NSString *)pass{
    self = [super initWithName:@"RequestLoginCommand"];
    if(self != nil){
        userid = [[NSString alloc] initWithString:uid];
        password = [[NSString alloc] initWithString:pass];
    }
    return self;
}

- (NSObject *) getTarget{
    if([AppConstants isLogin]) return [[NSString alloc] initWithFormat:@"%@/signon/login/device", [AppConstants getBaseUrl]];
    else return [[NSString alloc] initWithFormat:@"%@/signon/login/idpass", [AppConstants getBaseUrl]];
}

- (NSObject *) getSpecificInfo {
    NSDictionary *body;
    if([AppConstants isLogin]){
        // 로그인한 적이 있으므로 디바이스 아이디로 빠른 로그인
        body = [NSDictionary dictionaryWithObjectsAndKeys:userid, @"email",deviceid, @"deviceid", nil];
    } else {
        // 로그인한적이 없거나 로그아웃한 경우이므로 아이디, 패스워드 로그인
        body = [NSDictionary dictionaryWithObjectsAndKeys:userid,@"email",  password, @"pass", nil];
    }
    return body;
}

- (void) callBack:(NSString *) result
{
    NSDictionary *dict = [unmarshaller unmarshalToDictionary:result];
    if([dict objectForKey:@"error"] != nil) {
        NSLog(@"error cause=%@", [[dict objectForKey:@"error"] objectForKey:@"cause"]);
        [self.targetObject performSelector:failCallBack withObject:dict];
        return;
    }
    
    UserSession *userSession = [[UserSession alloc] initWithDictionary:dict];
    NSLog(@"%@", [userSession toString]);
    if(targetObject){
        [self.targetObject performSelector:successCallBack withObject:userSession];
    }
    
    // 로그인 한번 했으므로 로그인 표기함 추후에는 디바이스 아이디로 로그인하게 된다.
    [AppConstants setLoginTrue];
}
@end
