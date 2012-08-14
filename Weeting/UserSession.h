//
//  UserSession.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 21..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSession : NSObject
{
    NSNumber *uid;
    NSString *email;
    
}

- (id) initWithDictionary:(NSDictionary *) dictionary;

- (NSString *) toString;

@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *email;

@end
