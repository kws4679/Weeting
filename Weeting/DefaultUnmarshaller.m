//
//  DefaultUnmarshaller.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 21..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "DefaultUnmarshaller.h"

@implementation DefaultUnmarshaller
// 기본 언마샬러는 입력받은 소스를 그대로 리턴

- (NSObject *) unmarshal:(NSString *)source{
    return source;
}

- (NSDictionary *) unmarshalToDictionary:(NSString *)source
{
    return nil;
}
@end
