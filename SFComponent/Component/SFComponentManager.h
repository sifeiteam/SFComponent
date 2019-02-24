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
 @param error 错误信息
 @return 启动成功(YES)或失败(NO)
 */
- (BOOL)startupComponentWithName:(NSString *)name error:(NSError **)error;

/**
 移除组件

 @param name 组件名
 @param error 错误信息
 @return 移除成功(YES)或失败(NO)
 */
- (BOOL)removeComponentWithName:(NSString *)name error:(NSError **)error;

@end
