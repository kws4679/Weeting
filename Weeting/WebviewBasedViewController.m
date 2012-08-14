//
//  WebviewBasedViewController.m
//  Weeting
//
//  Created by 공완식 on 12. 8. 13..
//
//

#import "WebviewBasedViewController.h"
#import "AppConstants.h"

@interface WebviewBasedViewController ()

@end

@implementation WebviewBasedViewController
@synthesize webView;
@synthesize activityIndicator;
@synthesize html, directory;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //    NSURL *url = [[NSURL alloc] initWithString:@"http://www.naver.com"];
    //    NSData *data = [NSData dataWithContentsOfURL:url];
    //    [self.webView loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:url];
    
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //    [self.webView loadRequest:request];

    if(self.html == nil || self.directory == nil){
        NSLog(@"html, directory가 설정되지 않음");
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:html ofType:@"html" inDirectory:directory];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self.webView loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:url];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 여기서 이벤트 캐치하고 네이티브로 넘어가기
    NSURL *url = request.URL;
    NSString *path = [url path];    // 현재 path 가 만일 html에서 링크가 app://runtest 이런식으로 되어있으면
    // 이상하게 path 값이 "" 이 된다.(즉 없다) 그래서 현재 app:///runtest 로
    // html내에서 설정해놓음 이렇게하면 path 에 /runtest 가 할당되므로 /를 반드시 붙여서 비교
    // 추후 수정요망!!
    path = [path substringFromIndex:1];
    NSString *scheme = [url scheme];
    
    if([scheme isEqual:[AppConstants getAppScheme]]){
        
        // 주어진 이름으로 함수를 매핑함, 해당 컨트롤러에서 이벤트 함수를 구현해야한다.
        SEL selector = NSSelectorFromString(path);
        if(selector != nil) {
            [self performSelector:selector];
            return NO;
        }
        else
            NSLog(@"%@ event 등록되지 않았음", path);
    }
    
    return YES;
}

/*
 드래그 이벤트 캐치라는데....
 - (void)__touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
 {
 [self __touchesEnded:touches withEvent:event];
 
 id webView = [[self superview] superview];
 if (touches.count > 1) {
 if ([webView respondsToSelector:@selector(fireZoomingEndedWithTouches:event:)]) {
 [webView fireZoomingEndedWithTouches:touches event:event];
 }
 }
 else {
 
 for (UITouch *touch in touches) {
 // Sends to the dispatch method, which will make sure the appropriate subview is acted upon
 CGPoint pt = [touch locationInView:self];
 CGPoint pt2 = [touch previousLocationInView:self];
 if (CGPointEqualToPoint(pt, pt2)) {
 NSLog(@"탭");
 if ([webView respondsToSelector:@selector(fireTappedWithTouch:event:)]) {
 [webView fireTappedWithTouch:[touches anyObject] event:event];
 }
 }
 else {
 NSLog(@"드래그");
 }
 
 }
 
 }
 }*/
@end
