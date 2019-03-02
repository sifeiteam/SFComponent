//
//  SFLog.m
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFLog.h"
#import <fishhook/fishhook.h>

@implementation SFLog

void SF_NSLog(NSString *format, ...) {}

+ (void)load {
#ifndef DEBUG
    rebind_symbols((struct rebinding[1]){{"NSLog", SF_NSLog, NULL}}, 1);
#endif
}

@end
