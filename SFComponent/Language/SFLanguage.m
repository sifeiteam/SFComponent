//
//  SFLanguage.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFLanguage.h"
#import "SFBundle.h"

@implementation SFLanguage

+ (NSString *)localizedStringWithKey:(NSString *)key componentName:(NSString *)componentName {
    if (!key || key.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数key为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    if (!componentName || componentName.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数key为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    NSBundle *bundle = [SFBundle bundleWithComponentName:componentName];
    if (!bundle) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的bundle不存在", NSStringFromSelector(_cmd), componentName]);
        return nil;
    }
    
    NSString *language = [self getCurrentLanguage];
    
    if (!language || language.length == 0) {
        language = @"en";
    }
    
    NSString *lprojPath = [bundle pathForResource:language ofType:@"lproj" inDirectory:@"master/Localized"];
    
    if (!lprojPath || lprojPath.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的%@国际化文件不存在", NSStringFromSelector(_cmd), componentName, language]);
        return nil;
    }
    
    NSBundle *lprojBundle = [NSBundle bundleWithPath:lprojPath];
    if (!lprojBundle) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 组件%@的%@国际化文件不存在", NSStringFromSelector(_cmd), componentName, language]);
        return nil;
    }

    return NSLocalizedStringFromTableInBundle(key, @"Localizable", lprojBundle, @"");
}

+ (NSString *)getCurrentLanguage {
    NSArray<NSString *> *languages = [[NSUserDefaults standardUserDefaults] arrayForKey:@"AppleLanguages"];
    
    return [languages firstObject];
}

+ (NSArray<NSString *> *)getAllLanguagesSupported {
    return [NSLocale availableLocaleIdentifiers];
}

@end
