//
//  ViewController.m
//  SFComponentDemo
//
//  Created by XJY on 2019/2/24.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "ViewController.h"
#import <SFComponent/SFRoute.h>
#import <SFComponent/SFEventCenter.h>
#import "SFDemo1.h"
#import <SFComponent/SFColors.h>
#import <SFComponent/SFFont.h>
#import <SFComponent/SFImages.h>
#import <SFComponent/SFServerConfig.h>
#import <SFComponent/SFLanguage.h>
#import <SFComponent/SFInjection.h>
#import <SFComponent/SFView.h>
#import <SFComponent/SFSandbox.h>

@interface ViewController () <SFViewProtocol>

@property (nonatomic, strong) SFView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

        BOOL success = [SFRoute goToComponent:[SFDemo1 componentName] page:@"test" viewController:self context:@{}];
    
    //    id resultaa = [SFEventCenter sendEvent:@"eventaaa" componentName:[SFDemo1 componentName] context:@{} error:&error];
    
    [SFEventCenter sendEvent:@"eventdadd" componentName:[SFDemo1 componentName] context:@{} completion:^(id result) {
        
        int iii = 0;
    }];
    
    UIColor *color = SFColorWithNumber(1);
    
    
    UIFont *font = SFFontWithNumber(2);
    
    
    UIImage *image = [SFImages imageWithName:@"WX20190227-205248.png" componentName:[SFComponent componentName]];
    
    NSString *serv = [SFServerConfig serverWithKey:@"SFCOMPONENT_HOST_TEST" componentName:[SFComponent componentName]];
    
    NSString *text = [SFLanguage localizedStringWithKey:@"Text1" componentName:[SFComponent componentName]];
    
    NSString *lan = [SFLanguage getCurrentLanguage];
    
    NSArray *all = [SFLanguage getAllLanguagesSupported];
    
    [[SFInjection sharedInstance] injectWithIdentifier:@"123" params:@{@"sdf":@"1234"}];
    
    NSArray *arr = [[SFInjection sharedInstance] fetchInjectionParamsWithIdentifier:@"123"];
    
   self.testView = [SFView viewWithClassName:@"SFTestView" context:@{@"sdfs":@"fefew"}];
    self.testView.delegate = self;
    
    [self.testView sendMessageFromCallerToView:@{@"bbb" : @"0000"} key:@"abc"];
    
    NSString *a = [SFSandbox documentRootPathWithComponentName:[SFDemo1 componentName]];
    NSString *b = [SFSandbox libraryRootPathWithComponentName:[SFDemo1 componentName]];
    NSString *c = [SFSandbox cachesRootPathWithComponentName:[SFDemo1 componentName]];
    NSString *d = [SFSandbox tempRootPathWithComponentName:[SFDemo1 componentName]];
    
    int dd = 0 ;
}

- (void)view:(SFView *)view key:(NSString *)key message:(NSDictionary *)message {
    int i = 0;
}

@end
