//
//  SFColor.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SFColorWithKey(key) [[SFColor sharedInstance] colorWithKey:key]

@interface SFColor : NSObject

+ (instancetype)sharedInstance;

- (UIColor *)colorWithKey:(NSString *)key;

@end
