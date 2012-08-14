//
//  RequestLoginCommand.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "Command.h"

@interface RequestLoginCommand : Command <CommandProtocol>
{
    NSString *userid;
    NSString *password;
    
    NSString *deviceid;
}

- (id) initWithIdAndPassword: (NSString *) uid userpass:(NSString *) password;

@property (strong) NSString *userid;
@property (strong) NSString *password;
@property (strong) NSString *deviceid;
@end
