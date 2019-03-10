//
//  SFComponentManager.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>

@class SFComponent;

@interface SFComponentManager : NSObject

/**
 单例
 */
+ (instancetype)sharedInstance;

/**
 组件队列
 */
@property (nonatomic, strong, readonly) NSDictionary<NSString *, SFComponent *> *components;

/**
 启动组件

 @param name 组件名
 @return 启动成功(YES)或失败(NO)
 */
- (BOOL)startupComponentWithName:(NSString *)name;

/**
 移除组件

 @param name 组件名
 @return 移除成功(YES)或失败(NO)
 */
- (BOOL)removeComponentWithName:(NSString *)name;

/**
 判断组件是否有效
 
 @param name 组件名
 @return 有效（YES）无效（NO）
 */
- (BOOL)isComponentValid:(NSString *)name;

/**
 判断组件是否已启动

 @param name 组件名
 @return 已启动（YES）未启动（NO）
 */
- (BOOL)isComponentStartup:(NSString *)name;

@end
