//
//  SFImage.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFImage.h"
#import "SFBundle.h"

@implementation SFImage

+ (UIImage *)imageWithName:(NSString *)imageName componentName:(NSString *)componentName {
    if (!imageName || imageName.length == 0) {
        return nil;
    }
    if (!componentName || componentName.length == 0) {
        return nil;
    }
    NSBundle *bundle = [SFBundle bundleWithComponentName:componentName];
    if (!bundle) {
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
