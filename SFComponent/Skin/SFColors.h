//
//  SFColors.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SFColorWithNumber(number) [[SFColors sharedInstance] colorWithNumber:number]

@interface SFColors : NSObject

/**
 单例
 */
+ (instancetype)sharedInstance;

/**
 获取颜色

 @param number 颜色标号
 @return 颜色
 */
- (UIColor *)colorWithNumber:(NSInteger)number;

@end
