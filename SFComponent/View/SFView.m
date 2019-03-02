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
        return nil;
    }
    if (!viewClassName || viewClassName.length == 0) {
        return nil;
    }
    Class viewClass = NSClassFromString(viewClassName);
    if (!viewClass) {
        return nil;
    }
    //viewClass必须是SFView的子类
    if (![viewClass isSubclassOfClass:[SFView class]]) {
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
