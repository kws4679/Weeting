//
//  CommandAdapter.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 18..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"
#import "HttpConnection.h"
#import "Unmarshaller.h"
/*
    CommandAdapter 클래스는 Http통신을 객체통신으로 변환하기 위한 클래스이며 싱글톤으로 구현되어있다.
    간단한 사용 시나리오는 다음과 같다.
        1. Command interface 와 protocol을 따르는 객체 생성 및 Dependency Injection
        2. execute 메소드를 수행, 해당 메소드는 다음과 같은 역할을 함
            1) command 인터페이스의 target을 통해 통신 대상 지정(대체로 url)
            2) command 인터페이스의 specificInfo를 통해 통신 바디 지정(NSDictionary)
            3) httpConnection 의 콜백을 지정하여 통신이 끝난후 바로 command 인터페이스의 callBack을 호출
        3. 그 후 command 에서 구현한 대로 시나리오 진행.
 */
@interface CommandAdapter : NSObject
{
    Command *command;
    
    HttpConnection *httpConnection;
}

+ (CommandAdapter *) getInstance;

- (void) execute;
- (void) setHttpMethod:(NSString *) method;

@property (strong) Command *command;
@property (strong) HttpConnection *httpConnection;
@end
