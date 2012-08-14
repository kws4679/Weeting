//
//  HttpConnection.h
//  Weeting
//
//  Created by 공완식 on 12. 7. 17..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HttpConnection : NSObject
{
    NSMutableData *receivedData;
    NSURLResponse *__weak response;
    NSString *result;
    NSString *method;
    SEL selector;
}

- (BOOL)requestUrl:(NSString *)url bodyObject:(NSDictionary *)bodyObject;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)setDelegate:(id)aTarget selector:(SEL)aSelector;

@property (nonatomic) NSMutableData *receivedData;
@property (weak, nonatomic) NSURLResponse *response;
@property (nonatomic) NSString *result;
@property (strong) NSString *method;
@property (strong) id target;
@property (nonatomic, assign) SEL selector;
@end
