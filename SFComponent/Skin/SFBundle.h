//
//  SFBundle.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFBundle : NSObject

/**
 获取bundle

 @param componentName 组件名
 @return bundle
 */
+ (NSBundle *)bundleWithComponentName:(NSString *)componentName;

@end

NS_ASSUME_NONNULL_END
