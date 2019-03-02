//
//  SFServerConfig.m
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFServerConfig.h"
#import "SFConfiguration.h"

@implementation SFServerConfig

+ (NSString *)serverWithKey:(NSString *)key componentName:(NSString *)componentName {
    return [SFConfiguration configWithFileName:@"Server.plist" key:key componentName:componentName];
}

@end
