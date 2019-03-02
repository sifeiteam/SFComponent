//
//  SFLanguage.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFLanguage : NSObject

/**
 获取指定组件和Key的国际化字符串

 @param key 关键字
 @param componentName 组件名
 @return 国际化后的字符串
 */
+ (NSString *)localizedStringWithKey:(NSString *)key componentName:(NSString *)componentName;

@end

NS_ASSUME_NONNULL_END
