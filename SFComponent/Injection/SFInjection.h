//
//  SFInjection.h
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFInjectionProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFInjection : NSObject

/**
 单例
 */
+ (instancetype)sharedInstance;

/**
 添加代理

 @param delegate 代理
 */
- (void)addDelegate:(id <SFInjectionProtocol>)delegate identifier:(NSString *)identifier;

/**
 移除代理
 
 @param delegate 代理
 */
- (void)removeDelegate:(id <SFInjectionProtocol>)delegate identifier:(NSString *)identifier;

/**
 移除所有代理
 */
- (void)removeAllDelegateWithIdentifier:(NSString *)identifier;

/**
 注入

 @param identifier 唯一标识，业务自行定义
 @param params 参数信息
 @return 成功（YES）或失败（NO）
 */
- (BOOL)injectWithIdentifier:(NSString *)identifier params:(NSDictionary *)params;

/**
 获取注入的参数信息
 
 @param identifier 唯一标识，业务自行定义
 @return 参数信息
 */
- (NSArray<NSDictionary *> *)fetchInjectionParamsWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
