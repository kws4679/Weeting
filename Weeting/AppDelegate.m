//
//  AppDelegate.m
//  Weeting
//
//  Created by 공완식 on 12. 7. 3..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "CommandAdapter.h"
#import "AppConstants.h"
#import "RequestLoginCommand.h"
#import "WeetingContainer.h"
#import "XmlUnmarshaller.h"
#import "LoginViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // 우선 로그인이 된적이 있는지 검사함, 로그인이 안된경우는 처음앱을 깔았거나 로그아웃상태
    // 만일 위의 상태에 해당되면 가입 & 로그인 화면으로 전환해야한다.
    if(![AppConstants isLogin]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        self.window.rootViewController = loginViewController;
        [self.window addSubview:loginViewController.view];
        
        return YES;
    }    
    // deviceid 가 없을때만 호출한다, 아니면 등록하지 않음
    // 그런데 나중에 푸쉬할때 이게 필요할지도 모른다 아직은 잘 모르겠음
    if([AppConstants getDeviceId] == nil)
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
                (UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    else {
        WeetingContainer *ctx = [WeetingContainer getInstace];
        CommandAdapter *adapter = ctx.commandAdapter;
        
        adapter.command = [[RequestLoginCommand alloc] initWithIdAndPassword:@"asdf@snu.ac.kr" userpass:@"asdf"];
        ((RequestLoginCommand *) adapter.command).unmarshaller = [[XmlUnmarshaller alloc] init];
        
        [adapter.command setDelegate:self success:@selector(test) fail:@selector(test)];
        [adapter execute];
    }

    return YES;
}

- (void) test
{
    
}

- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *devToken = [[[[deviceToken description] 
                            stringByReplacingOccurrencesOfString:@"<"withString:@""] 
                           stringByReplacingOccurrencesOfString:@">" withString:@""] 
                          stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    NSString *str = [NSString 
                     stringWithFormat:@"Device Token=%@",devToken];
    NSLog(@"device token - %@",str);
    [AppConstants setDeviceId:str];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)err { 
    
    NSString *str = [NSString stringWithFormat: @"Error: %@", err];
    NSLog(@"Error %@",str);    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
