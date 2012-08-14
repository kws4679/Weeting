//
//  CommandAdapter.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "CommandAdapter.h"
@implementation CommandAdapter
@synthesize httpConnection;
@synthesize command;

- (id) init
{
    self = [super init];
    if(self != nil){
        httpConnection = [[HttpConnection alloc] init];
        command = nil;
    }
    return self;
}

+ (CommandAdapter *) getInstance
{
    static CommandAdapter *instance;
    if(instance == nil){
        @synchronized (self){
            if(instance == nil) instance = [[self alloc] init];
        }
    }
    return instance;
}

- (void) execute
{
    if(command != nil) {
        NSString *targetUrl = (NSString *)[command getTarget];
        NSDictionary *bodyObject = (NSDictionary *) [command getSpecificInfo];

        [httpConnection setDelegate:self selector:@selector(commandCallBack)];
        
        [httpConnection requestUrl:targetUrl bodyObject:bodyObject];
    } else 
        NSLog(@"Command 지정되지 않음");
}

- (void) commandCallBack {
    [command callBack:httpConnection.result];
}

- (void) setHttpMethod:(NSString *) method{
    httpConnection.method = method;
}
@end
