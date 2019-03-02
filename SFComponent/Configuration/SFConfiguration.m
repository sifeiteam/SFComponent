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
        return nil;
    }
    if (!key || key.length == 0) {
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
    NSString *name = [configFileName stringByDeletingPathExtension];
    // 获得文件的后缀名（不带'.'）
    NSString *suffix = [configFileName pathExtension];
    NSString *configPlistPath = [bundle pathForResource:name ofType:suffix inDirectory:@"master/Config"];
    if (!configPlistPath || configPlistPath.length == 0) {
        return nil;
    }
    NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:configPlistPath];
    if (!config || config.count == 0) {
        return nil;
    }
    return [config objectForKey:key];
}

@end
