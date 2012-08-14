//
//  Command.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Unmarshaller.h"
/*
    Command 인터페이스는 http request 의 객체이다.
    Command 인터페이스를 따르는 클래스는 반드시 CommandProtocol을 구현해야함
 
    target은 통신 대상(보통 서버 주소 NSString으로 타입 캐스팅)
    specificInfo 는 통신할때 요청 바디(NSDictionary 로 타입 캐스팅됨)
 
    Command를 CommandAdapter 에 DI시키기 이전에 생성되는 시점에서 델리게이트를 지정해 주어야함(지정안하면 콜백을 못받음).
 */
@protocol CommandProtocol <NSObject>

- (NSObject *) getTarget;
- (NSObject *) getSpecificInfo;

- (void) callBack:(NSString *) result;

- (id) initWithName:(NSString *) name;

@end

@interface Command : NSObject <CommandProtocol>
{
    NSString *commandName;
    
    NSObject *target;
    NSObject *specificInfo;
    
    id targetObject;
    SEL successCallBack;
    SEL failCallBack;
    
    // 각 Command는 개별 언마샬러를 가짐. 커맨드별로 ORM되어야할 객체 기술이 다를경우를 대비(XML, JSON 등등)
    // 기본 언마샬러는 DefaultUnmarshaller 로써 언마샬링하지 않는 로우 오브젝트를 반환한다
    Unmarshaller *unmarshaller;
}

- (void)setDelegate:(id)aTarget success:(SEL) _success fail:(SEL) _fail;

@property (strong) id targetObject;
@property SEL successCallBack;
@property SEL failCallBack;
@property (strong) Unmarshaller *unmarshaller;
@end

