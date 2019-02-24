//
//  SFComponent.h
//  SFComponent
//
//  Created by XJY on 2019/2/16.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

//SFComponent V1.0.0 功能点
//
//1、SFAppDelegate.h/m代替AppDelegate，并且转发生命周期方法到组件中 √
//2、组件入口基类，所有组件入口类都继承它，并且该基类提供了生命周期方法可重写做自己的事情。 √
//3、URL路由跳转实现组件间vc的push √
//4、事件机制，实现组件间通信 √
//5、语言包、图片、服务器环境配置都统一放在组件自己的Bundle中，封装统一的方法传入组件ID获取，只能获取自己的，不能跨组件获取。
//6、组件支持懒加载（即用到了才初始化） √
//7、统一沙盒存放路径的获取接口，每个组件都只能把文件存在自己的目录下
//8、统一使用组件名作为组件ID √

#import <Foundation/Foundation.h>
#import "SFAppDelegateProtocol.h"
#import "SFComponentLifeCycleProtocol.h"
#import "SFComponentRouteProtocol.h"
#import "SFComponentEventProtocol.h"

@interface SFComponent : NSObject
<
SFAppDelegateProtocol,
SFComponentLifeCycleProtocol,
SFComponentRouteProtocol,
SFComponentEventProtocol
>

/**
 组件名，不可重写
 */
+ (NSString *)componentName;

@end
