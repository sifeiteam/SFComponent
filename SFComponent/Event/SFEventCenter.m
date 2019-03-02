//
//  SFEventCenter.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFEventCenter.h"
#import "SFComponent.h"
#import "SFComponentManager.h"

@implementation SFEventCenter

+ (id)sendEvent:(NSString *)eventName
  componentName:(NSString *)componentName
        context:(NSDictionary *)context {
    if (!eventName || eventName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数eventName为空", NSStringFromSelector(_cmd)]);
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
    if (![component respondsToSelector:@selector(responseEvent:context:)]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ %@未重写responseEvent:context:", NSStringFromSelector(_cmd), componentName]);
        return nil;
    }
    
    return [component responseEvent:eventName context:context];
}

+ (void)sendEvent:(NSString *)eventName
    componentName:(NSString *)componentName
          context:(NSDictionary *)context
       completion:(void (^)(id))completion {
    if (!eventName || eventName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数eventName为空", NSStringFromSelector(_cmd)]);
        if (completion) {
            completion(nil);
        }
        return;
    }
    if (!componentName || componentName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数componentName为空", NSStringFromSelector(_cmd)]);
        if (completion) {
            completion(nil);
        }
        return;
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
            if (completion) {
                completion(nil);
            }
            return;
        }
    }
    if (![component respondsToSelector:@selector(asyncResponseEvent:context:completion:)]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ %@未重写asyncResponseEvent:context:completion:", NSStringFromSelector(_cmd), componentName]);
        if (completion) {
            completion(nil);
        }
        return;
    }
    
    [component asyncResponseEvent:eventName context:context completion:^(id result) {
        if (completion) {
            completion(result);
        }
    }];
}

@end
