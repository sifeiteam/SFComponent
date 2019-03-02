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
        return nil;
    }
    if (!componentName || componentName.length == 0) {
        return nil;
    }
    NSBundle *bundle = [SFBundle bundleWithComponentName:componentName];
    if (!bundle) {
        return nil;
    }
    
    NSArray<NSString *> *languages = [[NSUserDefaults standardUserDefaults] arrayForKey:@"AppleLanguages"];
    
    NSString *language = [languages firstObject];
    if (!language || language.length == 0) {
        language = @"en";
    }
    
    NSString *lprojPath = [bundle pathForResource:language ofType:@"lproj" inDirectory:@"master/Localized"];
    
    if (!lprojPath || lprojPath.length == 0) {
        return nil;
    }
    
    NSBundle *lprojBundle = [NSBundle bundleWithPath:lprojPath];
    if (!lprojBundle) {
        return nil;
    }

    return NSLocalizedStringFromTableInBundle(key, @"Localizable", lprojBundle, @"");
}

@end
