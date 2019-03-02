//
//  SFBundle.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFBundle.h"

@implementation SFBundle

+ (NSBundle *)bundleWithComponentName:(NSString *)componentName {
    if (!componentName || componentName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数componentName为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@Bundle.bundle", componentName]];
    if (!bundlePath || bundlePath.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的bundle不存在", NSStringFromSelector(_cmd), componentName]);
        return nil;
    }
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    return bundle;
}

@end
