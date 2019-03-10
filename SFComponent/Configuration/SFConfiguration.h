//
//  SFConfiguration.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 自定义配置必须配置在组件自己的Bundle->master->Config下
 */
@interface SFConfiguration : NSObject

/**
 获取自定义配置文件路径

 @param fileName 完整的文件名，带后缀
 @param componentName 组件名
 @return 文件路径
 */
+ (NSString *)filePathWithFileName:(NSString *)fileName
                     componentName:(NSString *)componentName;

/**
 获取自定义配置文件内容，文件数据必须能够直接转成NSDictionary，例如plist

 @param configFileName 完整的配置文件名，带后缀
 @param componentName 组件名
 @return 自定义配置文件内容
 */
+ (NSDictionary *)configDictionaryWithFileName:(NSString *)configFileName componentName:(NSString *)componentName;

/**
 获取自定义配置，文件数据必须能够直接转成NSDictionary，例如plist
 
 @param configFileName 完整的配置文件名，带后缀
 @param key 关键字
 @param componentName 组件名
 @return 配置
 */
+ (id)configWithFileName:(NSString *)configFileName key:(NSString *)key componentName:(NSString *)componentName;

@end

NS_ASSUME_NONNULL_END
