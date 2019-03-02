//
//  SFLanguage.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 国际化文件必须放在组件自己的Bundle->master->Localized下
 */
@interface SFLanguage : NSObject

/**
 获取指定组件和Key的国际化字符串

 @param key 关键字
 @param componentName 组件名
 @return 国际化后的字符串
 */
+ (NSString *)localizedStringWithKey:(NSString *)key componentName:(NSString *)componentName;

/**
 获取当前语言

 @return 语言
 */
+ (NSString *)getCurrentLanguage;

/**
 获取当前设备支持的所有语言

 @return 语言列表
 */
+ (NSArray<NSString *> *)getAllLanguagesSupported;

@end

NS_ASSUME_NONNULL_END
