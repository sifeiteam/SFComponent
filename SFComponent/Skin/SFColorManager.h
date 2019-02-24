//
//  SFColorManager.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SFColorWithKey(key) [[SFColorManager sharedInstance] colorWithKey:key]

@interface SFColorManager : NSObject

+ (instancetype)sharedInstance;

- (UIColor *)colorWithKey:(NSString *)key;

@end
