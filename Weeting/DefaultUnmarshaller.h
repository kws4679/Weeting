//
//  DefaultUnmarshaller.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 21..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "Unmarshaller.h"

/*
    기본 언마샬러
 */
@interface DefaultUnmarshaller : Unmarshaller <UnmarshalProtocol>

- (NSObject *) unmarshal:(NSString *)source;
- (NSDictionary *) unmarshalToDictionary:(NSString *)source;

@end
