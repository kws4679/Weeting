//
//  Unmarshaller.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 21..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
    ORM 언마살려 인터페이스
 */

// 매퍼 익명 내부 클래스
@interface Mapper : NSObject
- (NSObject *) map:(NSDictionary *) dictionary;
@end

@protocol UnmarshalProtocol <NSObject>
- (NSObject *) unmarshal:(NSString *) source _mapper:(Mapper *) mapper;
- (NSDictionary *) unmarshalToDictionary:(NSString *) source;
@end

@interface Unmarshaller : NSObject <UnmarshalProtocol>
@end
