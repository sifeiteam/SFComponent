//
//  SFImages.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFImages.h"
#import "SFBundle.h"

@implementation SFImages

+ (UIImage *)imageWithName:(NSString *)imageName componentName:(NSString *)componentName {
    if (!imageName || imageName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数imageName为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    if (!componentName || componentName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数componentName为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    NSBundle *bundle = [SFBundle bundleWithComponentName:componentName];
    if (!bundle) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的bundle不存在", NSStringFromSelector(_cmd), componentName]);
        return nil;
    }
    // 获得文件名
    NSString *name = [imageName stringByDeletingPathExtension];
    // 获得文件的后缀名（不带'.'）
    NSString *suffix = [imageName pathExtension];
    // 根据设备判断取1x  2x  3x
    CGFloat scale = [UIScreen mainScreen].scale;

    NSString *imagePath = [self imagePathWithScale:scale bundle:bundle name:name suffix:suffix];
    if (!imagePath || imagePath.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的图片%@不存在", NSStringFromSelector(_cmd), componentName, imageName]);
        return nil;
    }
    return [UIImage imageWithContentsOfFile:imagePath];
}

+ (NSString *)imagePathWithScale:(CGFloat)scale bundle:(NSBundle *)bundle name:(NSString *)name suffix:(NSString *)suffix {
    NSString *imagePath = nil;
    if (scale < 2) {
        //1x
        imagePath = [bundle pathForResource:name ofType:suffix inDirectory:@"master/Image"];
    } else if (scale < 3) {
        //2x
        imagePath = [bundle pathForResource:[name stringByAppendingString:@"@2x"] ofType:suffix inDirectory:@"master/Image"];
        if (!imagePath || imagePath.length == 0) {
            return [self imagePathWithScale:scale - 1 bundle:bundle name:name suffix:suffix];
        }
    } else {
        //3x
        imagePath = [bundle pathForResource:[name stringByAppendingString:@"@3x"] ofType:suffix inDirectory:@"master/Image"];
        if (!imagePath || imagePath.length == 0) {
            return [self imagePathWithScale:scale - 1 bundle:bundle name:name suffix:suffix];
        }
    }
    return imagePath;
}

@end
