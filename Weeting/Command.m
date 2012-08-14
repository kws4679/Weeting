//
//  Command.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "Command.h"
#import "DefaultUnmarshaller.h"

@implementation Command
@synthesize targetObject;
@synthesize successCallBack, failCallBack;
@synthesize unmarshaller;

- (id) initWithName:(NSString *) name
{
    self = [super init];
    if(self != nil){
        commandName = [[NSString alloc] initWithString:name];
        unmarshaller = [[DefaultUnmarshaller alloc] init];
    }
    return self;
}

- (void)setDelegate:(id)aTarget success:(SEL)_success fail:(SEL)_fail
{
    self.targetObject = aTarget;
    self.successCallBack = _success;
    self.failCallBack = _fail;
}

@end
