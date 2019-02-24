//
//  SFRoute.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SFRoute : NSObject

/**
 前往指定组件的指定页面

 @param componentName 组件名
 @param page 页面标识，由组件自行定义
 @param viewController 当前控制器，也可以传导航控制器，用于被跳转的组件内部push或present。
 @param error 失败原因
 @param context 上下文，可以在这里传参数
 */
+ (BOOL)goToComponent:(NSString *)componentName
                 page:(NSString *)page
       viewController:(UIViewController *)viewController
              context:(NSDictionary *)context
                error:(NSError **)error;

@end
