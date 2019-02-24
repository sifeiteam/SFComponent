//
//  SFFont.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SFFontWithKey(key) [[SFFont sharedInstance] fontWithKey:key]

@interface SFFont : NSObject

+ (instancetype)sharedInstance;

- (UIFont *)fontWithKey:(NSString *)key;

@end
