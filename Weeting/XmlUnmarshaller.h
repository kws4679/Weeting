//
//  XmlUnmarshaller.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 21..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "Unmarshaller.h"
/*
    XML 언마살러
    속도를 위해 xml파싱하지 않고 직접 하드코딩할것인가?
    
 */
@interface XmlUnmarshaller : Unmarshaller <UnmarshalProtocol>

- (NSObject *) unmarshal:(NSString *)source _mapper:(Mapper *)mapper;
- (NSDictionary *) unmarshalToDictionary:(NSString *)source;

@end
