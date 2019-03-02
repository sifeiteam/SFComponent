//
//  SFSandbox.h
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFSandbox : NSObject

/**
 获取指定组件的document根目录路径

 @param componentName 组件名
 @return 路径
 */
+ (NSString *)documentRootPathWithComponentName:(NSString *)componentName;

/**
 获取指定组件的library根目录路径
 
 @param componentName 组件名
 @return 路径
 */
+ (NSString *)libraryRootPathWithComponentName:(NSString *)componentName;

/**
 获取指定组件的caches根目录路径
 
 @param componentName 组件名
 @return 路径
 */
+ (NSString *)cachesRootPathWithComponentName:(NSString *)componentName;

/**
 获取指定组件的temp根目录路径
 
 @param componentName 组件名
 @return 路径
 */
+ (NSString *)tempRootPathWithComponentName:(NSString *)componentName;

@end

NS_ASSUME_NONNULL_END
