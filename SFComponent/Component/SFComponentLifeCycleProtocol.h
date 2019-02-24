//
//  SFComponentLifeCycleProtocol.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#ifndef SFComponentLifeCycleProtocol_h
#define SFComponentLifeCycleProtocol_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol SFComponentLifeCycleProtocol <NSObject>

@optional

/**
 启动成功后回调
 */
- (void)didFinishStartup;

/**
 将要被移除
 */
- (void)willBeRemoved;

@end

#endif /* SFComponentLifeCycleProtocol_h */
