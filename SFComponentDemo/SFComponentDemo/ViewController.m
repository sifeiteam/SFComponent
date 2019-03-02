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
#import <SFComponent/SFImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSError *error = nil;
    //    BOOL success = [SFRoute goToComponent:[SFDemo1 componentName] page:@"test" viewController:self context:@{} error:&error];
    
    //    id resultaa = [SFEventCenter sendEvent:@"eventaaa" componentName:[SFDemo1 componentName] context:@{} error:&error];
    
    [SFEventCenter sendEvent:@"eventdadd" componentName:[SFDemo1 componentName] context:@{} completion:^(id result, NSError *err) {
        
        int iii = 0;
    }];
    
    UIColor *color = SFColorWithNumber(1);
    
    
    UIFont *font = SFFontWithNumber(2);
    
    
    UIImage *image = [SFImage imageWithName:@"WX20190227-205248.png" componentName:[SFComponent componentName]];
    
    int isdf = 0;
}


@end
