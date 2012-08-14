//
//  XmlUnmarshaller.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 21..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "XmlUnmarshaller.h"
#import "XMLReader.h"

@implementation XmlUnmarshaller

// 기본 언마샬 메소드, 메퍼클래스를받아와서 매핑한후 오브젝트를 리턴한다
- (NSObject *) unmarshal:(NSString *)source _mapper:(Mapper *)mapper
{
    NSError *error = nil;
    NSDictionary *dictionary = [XMLReader dictionaryForXMLString:source error:error];
    
    return [mapper map:dictionary];
}

// 딕션어리 형태 오브젝트로 매핑한후 리턴한다 
- (NSDictionary *) unmarshalToDictionary:(NSString *)source{
    return [XMLReader dictionaryForXMLString:source error:nil];
}
@end
