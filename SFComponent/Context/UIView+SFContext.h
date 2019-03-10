//
//  UIView+SFContext.h
//  SFComponent
//
//  Created by XJY on 2019/3/10.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SFContext)

/**
 获取所在的控制器
 */
@property (nonatomic, weak, readonly) UIViewController *sf_controller;

/**
 上下文，如果当前View没有，就找父视图，直到寻找结束。
 */
@property (nonatomic, strong) id sf_context;

@end

NS_ASSUME_NONNULL_END
