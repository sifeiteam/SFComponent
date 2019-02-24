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
        context:(NSDictionary *)context
          error:(NSError *__autoreleasing *)error {
    if (!eventName || eventName.length == 0) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"参数eventName为空"}];
        }
        return nil;
    }
    if (!componentName || componentName.length == 0) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"参数componentName为空"}];
        }
        return nil;
    }
    
    SFComponent *component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
    if (!component) {
        //组件未启动，则启动该组件
        BOOL startupSuccess = [[SFComponentManager sharedInstance] startupComponentWithName:componentName error:NULL];
        if (startupSuccess) {
            component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
        }
        if (!component) {
            if (error) {
                *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : [NSString stringWithFormat:@"组件%@不存在", componentName]}];
            }
            return nil;
        }
    }
    if (![component respondsToSelector:@selector(responseEvent:context:)]) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : [NSString stringWithFormat:@"%@未重写responseEvent:context:", componentName]}];
        }
        return nil;
    }
    
    return [component responseEvent:eventName context:context];
}

+ (void)sendEvent:(NSString *)eventName
    componentName:(NSString *)componentName
          context:(NSDictionary *)context
       completion:(void (^)(id, NSError *))completion {
    if (!eventName || eventName.length == 0) {
        if (completion) {
            completion(nil, [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"参数eventName为空"}]);
        }
        return;
    }
    if (!componentName || componentName.length == 0) {
        if (completion) {
            completion(nil, [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"参数componentName为空"}]);
        }
        return;
    }
    
    SFComponent *component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
    if (!component) {
        //组件未启动，则启动该组件
        BOOL startupSuccess = [[SFComponentManager sharedInstance] startupComponentWithName:componentName error:NULL];
        if (startupSuccess) {
            component = [[SFComponentManager sharedInstance].components objectForKey:componentName];
        }
        if (!component) {
            if (completion) {
                completion(nil, [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : [NSString stringWithFormat:@"组件%@不存在", componentName]}]);
            }
            return;
        }
    }
    if (![component respondsToSelector:@selector(asyncResponseEvent:context:completion:)]) {
        if (completion) {
            completion(nil, [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : [NSString stringWithFormat:@"%@未重写asyncResponseEvent:context:completion:", componentName]}]);
        }
        return;
    }
    
    [component asyncResponseEvent:eventName context:context completion:^(id result) {
        if (completion) {
            completion(result, nil);
        }
    }];
}

@end
