//
//  SFComponentEventProtocol.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#ifndef SFComponentEventProtocol_h
#define SFComponentEventProtocol_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol SFComponentEventProtocol <NSObject>

@optional

/**
 响应事件，同步返回

 @param eventName 事件名
 @param context 上下文，带有事件所需的信息
 @return 返回值
 */
- (id)responseEvent:(NSString *)eventName context:(NSDictionary *)context;

/**
 响应事件，异步返回
 
 @param eventName 事件名
 @param context 上下文，带有事件所需的信息
 @param completion 异步返回结果
 */
- (void)asyncResponseEvent:(NSString *)eventName context:(NSDictionary *)context completion:(void (^)(id result))completion;

@end

#endif /* SFComponentEventProtocol_h */
