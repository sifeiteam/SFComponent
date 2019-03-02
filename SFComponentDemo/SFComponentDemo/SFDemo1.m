//
//  SFDemo1.m
//  SFComponentDemo
//
//  Created by XJY on 2019/2/24.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFDemo1.h"
#import <SFComponent/SFInjection.h>

@interface SFDemo1 () <SFInjectionProtocol>

@end

@implementation SFDemo1

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    int i = 0;
    
    return YES;
}

- (void)didFinishStartup {
    [[SFInjection sharedInstance] addDelegate:self identifier:@"123"];
    int i = 0;
}

- (void)willBeRemoved {
    int i = 0;
}

- (BOOL)goToPage:(NSString *)page viewController:(UIViewController *)viewController context:(NSDictionary *)context error:(NSError *__autoreleasing *)error {
    
    return YES;
}

- (id)responseEvent:(NSString *)eventName context:(NSDictionary *)context {
    return @"343";
}

- (void)asyncResponseEvent:(NSString *)eventName context:(NSDictionary *)context completion:(void (^)(id))completion {
    completion(@"123");
}

#pragma mark - SFInjectionProtocol

- (void)observeWithIdentifier:(NSString *)identifier params:(NSDictionary *)params {
    int ii = 0;
}

@end
