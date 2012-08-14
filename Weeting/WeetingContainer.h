//
//  WeetingContainer.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 20..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ContainerBase.h"
#import "CommandAdapter.h"

@interface WeetingContainer : ContainerBase
{
    CommandAdapter *commandAdapter;
}

+ (WeetingContainer *) getInstace;

@property (nonatomic, strong) CommandAdapter *commandAdapter;
@end
