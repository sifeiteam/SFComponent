//
//  UIView+SFContext.m
//  SFComponent
//
//  Created by XJY on 2019/3/10.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "UIView+SFContext.h"
#import <objc/runtime.h>

static void *kSFContext = "kSFContext";

@implementation UIView (SFContext)

- (UIViewController *)sf_controller {
    id target = self.nextResponder;
    Class UIViewControllerClass = [UIViewController class];
    while (target) {
        if ([target isKindOfClass:UIViewControllerClass]) {
            return target;
        }
        target = ((UIResponder *)target).nextResponder;
    }
    return nil;
}

- (void)setSf_context:(id)sf_context {
    objc_setAssociatedObject(self, kSFContext, sf_context, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)sf_context {
    id context = objc_getAssociatedObject(self, kSFContext);
    if (!context) {
        context = self.superview.sf_context;
    }
    return context;
}

@end
