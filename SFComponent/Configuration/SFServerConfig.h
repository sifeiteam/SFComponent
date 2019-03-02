//
//  SFServerConfig.h
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 服务器配置必须配置在组件自己的Bundle->master->Config->Server.plist下
 */
@interface SFServerConfig : NSObject

/**
 获取服务器配置

 @param key 关键字
 @param componentName 组件名
 @return 服务器配置
 */
+ (NSString *)serverWithKey:(NSString *)key componentName:(NSString *)componentName;

@end

NS_ASSUME_NONNULL_END
