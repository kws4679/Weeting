//
//  FirstMenuViewController.m
//  Weeting
//
//  Created by 공완식 on 12. 8. 13..
//
//

#import "FirstMenuViewController.h"
#import "MBProgressHUD.h"
#import "AppConstants.h"

@interface FirstMenuViewController ()

@end

@implementation FirstMenuViewController

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
    self.html = @"first";
    self.directory = @"www";
    [super viewDidLoad];
	// Do any additional setup after loading the view.

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


- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        // Do something...
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
}


#pragma html functions
#pragma start

- (void) onOk
{
    NSLog(@"onOk");
}

- (void) onReject
{
    NSLog(@"onReject");
}
#pragma end
@end
