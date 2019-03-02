//
//  SFConfiguration.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFConfiguration.h"
#import "SFBundle.h"

@implementation SFConfiguration

+ (id)configWithFileName:(NSString *)configFileName key:(NSString *)key componentName:(NSString *)componentName {
    if (!configFileName || configFileName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数configFileName为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    if (!key || key.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数key为空", NSStringFromSelector(_cmd)]);
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
    NSString *name = [configFileName stringByDeletingPathExtension];
    // 获得文件的后缀名（不带'.'）
    NSString *suffix = [configFileName pathExtension];
    NSString *configPlistPath = [bundle pathForResource:name ofType:suffix inDirectory:@"master/Config"];
    if (!configPlistPath || configPlistPath.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的%@文件不存在", NSStringFromSelector(_cmd), componentName, configFileName]);
        return nil;
    }
    NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:configPlistPath];
    if (!config || config.count == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的%@文件内容为空", NSStringFromSelector(_cmd), componentName, configFileName]);
        return nil;
    }
    return [config objectForKey:key];
}

@end
