//
//  SFFont.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SFFontWithNumber(number) [[SFFont sharedInstance] fontWithNumber:number]

@interface SFFont : NSObject

/**
 单例
 */
+ (instancetype)sharedInstance;

/**
 获取字体

 @param number 字体编号
 @return 字体
 */
- (UIFont *)fontWithNumber:(NSInteger)number;

@end
