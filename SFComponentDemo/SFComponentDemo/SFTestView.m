//
//  SFTestView.m
//  SFComponentDemo
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFTestView.h"

@implementation SFTestView

+ (instancetype)viewWithClassName:(NSString *)viewClassName context:(NSDictionary *)context {
    return [[SFTestView alloc] init];
}

- (void)sendMessageFromCallerToView:(NSDictionary *)message key:(NSString *)key {
    [self sendMessageFromViewToCaller:message key:key];
}

@end
