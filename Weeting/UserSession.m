//
//  UserSession.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 21..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "UserSession.h"

@implementation UserSession
@synthesize uid,email;

- (id) initWithDictionary:(NSDictionary *) dictionary
{
    self = [super init];
    if(self != nil){
        @try {
            NSDictionary *user = [dictionary objectForKey:@"user"];
            
            self.uid = [user objectForKey:@"id"];
            self.email = [user objectForKey:@"email"];
        }
        @catch (NSException *exception) {
            NSLog(@"UserSession initWithDictionary mapping fail.");
        }
        @finally {
            return self;
        }
    }
}

- (NSString *) toString{
    return [NSString stringWithFormat:@"uid=%@&email=%@", uid, email];
}
@end
