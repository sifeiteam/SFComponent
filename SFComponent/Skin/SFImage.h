//
//  SFImage.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFImage : NSObject

/**
 获取图片

 @param imageName 图片名
 @param componentName 组件名
 @return 图片
 */
+ (UIImage *)imageWithName:(NSString *)imageName componentName:(NSString *)componentName;

@end

NS_ASSUME_NONNULL_END
