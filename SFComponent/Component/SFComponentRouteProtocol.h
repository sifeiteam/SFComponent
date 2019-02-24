//
//  SFComponentRouteProtocol.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#ifndef SFComponentRouteProtocol_h
#define SFComponentRouteProtocol_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol SFComponentRouteProtocol <NSObject>

@optional

/**
 前往某个页面
 
 @param page 页面标识，由组件自行定义
 @param viewController 当前控制器，也可以传导航控制器，用于被跳转的组件内部push或present。
 @param context 上下文
 @param error 错误原因
 @return 成功(YES)或失败(NO)
 */
- (BOOL)goToPage:(NSString *)page
  viewController:(UIViewController *)viewController
         context:(NSDictionary *)context
           error:(NSError **)error;

@end

#endif /* SFComponentRouteProtocol_h */
