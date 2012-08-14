//
//  WeetingContainer.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 20..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "WeetingContainer.h"

@implementation WeetingContainer
@synthesize commandAdapter;

+ (WeetingContainer *) getInstace
{
    static WeetingContainer *instance;
    if(instance == nil){
        @synchronized (self){
            if(instance == nil) {
                instance = [[self alloc] init];   
                instance.commandAdapter = [CommandAdapter getInstance];
            }
        }
    }
    return instance;
}

@end
