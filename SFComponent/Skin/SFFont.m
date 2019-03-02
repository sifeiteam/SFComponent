//
//  SFFont.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFFont.h"
#import "SFBundle.h"
#import "SFComponent.h"

@interface SFFont ()

@property (nonatomic, strong, readonly) NSDictionary *fonts;

@end

@implementation SFFont

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
        if (!bundle) {
            return self;
        }
        
        NSString *fontPlistPath = [bundle pathForResource:@"Font" ofType:@"plist" inDirectory:@"master"];
        if (!fontPlistPath || fontPlistPath.length == 0) {
            return self;
        }
        _fonts = [NSDictionary dictionaryWithContentsOfFile:fontPlistPath];
    }
    return self;
}

- (UIFont *)fontWithNumber:(NSInteger)number {
    NSString *key = @(number).stringValue;
    if (!key || key.length == 0) {
        return nil;
    }
    
    NSString *fontName = [self.fonts objectForKey:@"font"];
    CGFloat size = [[self.fonts objectForKey:key] floatValue];
    if (fontName && fontName.length > 0) {
        return [UIFont fontWithName:fontName size:size];
    }
    return [UIFont systemFontOfSize:size];
}

@end
