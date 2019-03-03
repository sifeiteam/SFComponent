//
//  SFRoute.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFRoute.h"
#import "SFComponent.h"
#import "SFComponentManager.h"

@implementation SFRoute

+ (BOOL)goToComponent:(NSString *)componentName
                 page:(NSString *)page
       viewController:(UIViewController *)viewController
              context:(NSDictionary *)context {
    if (!componentName || componentName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数componentName为空", NSStringFromSelector(_cmd)]);
        return NO;
    }
    
    SFComponent *component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
    if (!component) {
        //组件未启动，则启动该组件
        BOOL startupSuccess = [[SFComponentManager sharedInstance] startupComponentWithName:componentName];
        if (startupSuccess) {
            component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
        }
        if (!component) {
            NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@不存在", NSStringFromSelector(_cmd), componentName]);
            return NO;
        }
    }
    if (![component respondsToSelector:@selector(goToPage:viewController:context:)]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ %@未重写goToPage:viewController:context:", NSStringFromSelector(_cmd), componentName]);
        return NO;
    }
    
    return [component goToPage:page viewController:viewController context:context];
}

+ (UIViewController *)getPage:(NSString *)page
                componentName:(NSString *)componentName
                      context:(NSDictionary *)context {
    if (!page || page.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数page为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    if (!componentName || componentName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数componentName为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    
    SFComponent *component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
    if (!component) {
        //组件未启动，则启动该组件
        BOOL startupSuccess = [[SFComponentManager sharedInstance] startupComponentWithName:componentName];
        if (startupSuccess) {
            component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
        }
        if (!component) {
            NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@不存在", NSStringFromSelector(_cmd), componentName]);
            return nil;
        }
    }
    if (![component respondsToSelector:@selector(getPage:context:)]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ %@未重写getPage:context:", NSStringFromSelector(_cmd), componentName]);
        return nil;
    }
    
    return [component getPage:page context:context];
}

@end
