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
              context:(NSDictionary *)context
                error:(NSError *__autoreleasing *)error {
    if (!componentName || componentName.length == 0) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"参数componentName为空"}];
        }
        return NO;
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
            return NO;
        }
    }
    if (![component respondsToSelector:@selector(goToPage:viewController:context:error:)]) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : [NSString stringWithFormat:@"%@未重写goToPage:viewController:context:error:", componentName]}];
        }
        return NO;
    }
    
    return [component goToPage:page viewController:viewController context:context error:error];
}

@end
