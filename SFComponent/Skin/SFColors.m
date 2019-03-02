//
//  SFColors.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFColors.h"
#import "SFBundle.h"
#import "SFComponent.h"

@interface SFColors ()

@property (nonatomic, strong) NSMutableDictionary *colors;

@end

@implementation SFColors

+ (instancetype)sharedInstance {
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSBundle *bundle = [SFBundle bundleWithComponentName:[SFComponent componentName]];
        
        NSString *colorPlistPath = [bundle pathForResource:@"Color" ofType:@"plist"];
        self.colors = [NSMutableDictionary dictionaryWithContentsOfFile:colorPlistPath];
    }
    return self;
}

- (UIColor *)colorWithNumber:(NSInteger)number {
    NSString *key = @(number).stringValue;
    if (!key || key.length == 0) {
        return nil;
    }
    NSString *hexColor = [self.colors objectForKey:key];
    if (!hexColor || hexColor.length == 0) {
        return nil;
    }
    return [SFColors colorWithHexString:hexColor alpha:1];
}

/**
 16进制颜色转换为UIColor
 
 @param hexColor 16进制字符串（可以以0x开头，可以以#开头，也可以就是6位的16进制）
 @param opacity 透明度
 @return 16进制字符串对应的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(float)opacity {
    NSString * cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString * rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString * gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString * bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:opacity];
}

@end
