//
//  SFSandbox.m
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFSandbox.h"

@implementation SFSandbox

+ (NSString *)documentRootPathWithComponentName:(NSString *)componentName {
    if (!componentName || componentName.length == 0) {
        return nil;
    }
    // 获取Documents目录路径
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return [self appendRootPath:docDir componentName:componentName];
}

+ (NSString *)libraryRootPathWithComponentName:(NSString *)componentName {
    if (!componentName || componentName.length == 0) {
        return nil;
    }
    //获取Library的目录路径
    NSString *libDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    return [self appendRootPath:libDir componentName:componentName];
}

+ (NSString *)cachesRootPathWithComponentName:(NSString *)componentName {
    if (!componentName || componentName.length == 0) {
        return nil;
    }
    // 获取cache目录路径
    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return [self appendRootPath:cachesDir componentName:componentName];
}

+ (NSString *)tempRootPathWithComponentName:(NSString *)componentName {
    if (!componentName || componentName.length == 0) {
        return nil;
    }
    // 获取tmp目录路径
    NSString *tmpDir = NSTemporaryDirectory();
    return [self appendRootPath:tmpDir componentName:componentName];
}

+ (NSString *)appendRootPath:(NSString *)rootPath componentName:(NSString *)componentName {
    NSString *path = [rootPath stringByAppendingPathComponent:@"components"];
    return [path stringByAppendingPathComponent:componentName];
}

@end
