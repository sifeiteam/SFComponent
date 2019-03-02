//
//  SFComponent.h
//  SFComponent
//
//  Created by XJY on 2019/2/16.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

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
