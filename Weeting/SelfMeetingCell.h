//
//  SelfMeetingCell.h
//  Weeting
//
//  Created by 공완식 on 12. 8. 14..
//
//

#import <UIKit/UIKit.h>

@interface SelfMeetingCell : UITableViewCell
{
    IBOutlet UIWebView *webView;
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end
