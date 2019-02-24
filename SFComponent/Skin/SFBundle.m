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
        return nil;
    }
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@Bundle.bundle", componentName]];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    return bundle;
}

@end
