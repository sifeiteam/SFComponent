//
//  SFView.m
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFView.h"

@implementation SFView

+ (instancetype)viewWithClassName:(NSString *)viewClassName context:(NSDictionary *)context {
    //如果子类没重写该方法，或者调用了[super viewWithClassName:context]，直接返回空视图。
    if (![NSStringFromClass([self class]) isEqualToString:@"SFView"]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 子类没重写该方法，或者调用了[super viewWithClassName:context]", NSStringFromSelector(_cmd)]);
        return nil;
    }
    if (!viewClassName || viewClassName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数viewClassName为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    Class viewClass = NSClassFromString(viewClassName);
    if (!viewClass) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 类%@不存在", NSStringFromSelector(_cmd), viewClassName]);
        return nil;
    }
    //viewClass必须是SFView的子类
    if (![viewClass isSubclassOfClass:[SFView class]]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 类%@不是SFView的子类", NSStringFromSelector(_cmd), viewClassName]);
        return nil;
    }
    return [viewClass viewWithClassName:viewClassName context:context];
}

- (void)sendMessageFromCallerToView:(NSDictionary *)message key:(NSString *)key {
    
}

- (void)sendMessageFromViewToCaller:(NSDictionary *)message key:(NSString *)key {
    if (self.delegate && [self.delegate respondsToSelector:@selector(view:key:message:)]) {
        [self.delegate view:self key:key message:message];
    }
}

@end
