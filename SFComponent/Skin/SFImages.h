//
//  SFImages.h
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 图片必须放在组件自己的Bundle->master->Image下
 */
@interface SFImages : NSObject

/**
 获取图片

 @param imageName 图片名，格式：abc.png，不需要带@2x,@3x。但是图片文件名一定要有@2x和@3x
 @param componentName 组件名
 @return 图片
 */
+ (UIImage *)imageWithName:(NSString *)imageName componentName:(NSString *)componentName;

@end

NS_ASSUME_NONNULL_END
