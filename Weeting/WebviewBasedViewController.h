//
//  WebviewBasedViewController.h
//  Weeting
//
//  Created by 공완식 on 12. 8. 13..
//
//

#import <UIKit/UIKit.h>

@interface WebviewBasedViewController : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UIWebView *webView;
    
    NSString *html;
    NSString *directory;
    
    NSMutableDictionary *events;    // html의 이벤트와 액션 매핑을 위한 딕셔너리
                                    // 현재 사용 안하는중, 그냥 이름으로 함수 매핑중
}

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) NSString *directory;
@property (nonatomic, strong) NSMutableDictionary *events;

@end
