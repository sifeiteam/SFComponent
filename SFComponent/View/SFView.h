//
//  SFView.h
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFViewProtocol.h"

@interface SFView : UIView

/**
 代理
 */
@property (nonatomic, weak) id <SFViewProtocol> delegate;

/**
 创建视图，子类必须重写

 @param viewClassName 视图类名，该类必须继承SFView
 @param context 上下文，可在此传参数，视图提供方提供规范
 @return 视图
 */
+ (instancetype)viewWithClassName:(NSString *)viewClassName context:(NSDictionary *)context;

/**
 用于调用者向视图单向通信，子类可重写该方法接收消息

 @param message 消息体，视图提供方提供规范
 @param key 用于区分消息，视图提供方提供规范
 */
- (void)sendMessageFromCallerToView:(NSDictionary *)message key:(NSString *)key;

/**
 用于视图向调用者单向通信，子类可调用该方法向调用者发送消息

 @param message 消息体，视图提供方提供规范
 @param key 用于区分消息，视图提供方提供规范
 */
- (void)sendMessageFromViewToCaller:(NSDictionary *)message key:(NSString *)key;

@end
