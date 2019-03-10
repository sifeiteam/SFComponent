//
//  SFConfiguration.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFConfiguration.h"
#import "SFBundle.h"

@implementation SFConfiguration

+ (NSString *)filePathWithFileName:(NSString *)fileName
                     componentName:(NSString *)componentName {
    if (!fileName || fileName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数fileName为空", NSStringFromSelector(_cmd)]);
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
    NSString *name = [fileName stringByDeletingPathExtension];
    // 获得文件的后缀名（不带'.'）
    NSString *suffix = [fileName pathExtension];
    NSString *filePath = [bundle pathForResource:name ofType:suffix inDirectory:@"master/Config"];
    return filePath;
}

+ (NSDictionary *)configDictionaryWithFileName:(NSString *)configFileName componentName:(NSString *)componentName {
    NSString *configPlistPath = [self filePathWithFileName:configFileName componentName:componentName];
    if (!configPlistPath || configPlistPath.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的%@文件不存在", NSStringFromSelector(_cmd), componentName, configFileName]);
        return nil;
    }
    NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:configPlistPath];
    return config;
}

+ (id)configWithFileName:(NSString *)configFileName key:(NSString *)key componentName:(NSString *)componentName {
    NSDictionary *config = [self configDictionaryWithFileName:configFileName componentName:componentName];
    if (!config || config.count == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的%@文件内容为空", NSStringFromSelector(_cmd), componentName, configFileName]);
        return nil;
    }
    return [config objectForKey:key];
}

@end
