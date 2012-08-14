//
//  ThirdMenuViewController.h
//  Weeting
//
//  Created by 공완식 on 12. 8. 14..
//
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"
#import "WebviewBasedViewController.h"

@interface ThirdMenuViewController : PullRefreshTableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong) NSArray *data;

@end
