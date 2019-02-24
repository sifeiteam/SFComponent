//
//  SFEventCenter.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>

@interface SFEventCenter : NSObject

/**
 发送事件，同步返回

 @param eventName 事件名
 @param componentName 组件名
 @param context 上下文，可以在此传参数
 @param error 错误原因
 @return 返回值
 */
+ (id)sendEvent:(NSString *)eventName
    componentName:(NSString *)componentName
          context:(NSDictionary *)context
            error:(NSError **)error;

/**
 发送事件，支持异步返回

 @param eventName 事件名
 @param componentName 组件名
 @param context 上下文，可以在此传参数
 @param completion 返回结果和错误信息
 */
+ (void)sendEvent:(NSString *)eventName
    componentName:(NSString *)componentName
          context:(NSDictionary *)context
       completion:(void (^)(id result, NSError *error))completion;

@end
