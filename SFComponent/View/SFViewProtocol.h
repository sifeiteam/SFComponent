//
//  SFViewProtocol.h
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#ifndef SFViewProtocol_h
#define SFViewProtocol_h

@class SFView;

@protocol SFViewProtocol <NSObject>

/**
 用于视图向调用者单向通信，调用者实现此方法即可监听处理通信消息。

 @param view 视图
 @param key 用于区分消息，视图提供方提供规范
 @param message 消息，视图提供方提供规范
 */
- (void)view:(SFView *)view key:(NSString *)key message:(NSDictionary *)message;

@end

#endif /* SFViewProtocol_h */
