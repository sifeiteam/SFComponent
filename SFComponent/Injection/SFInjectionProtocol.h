//
//  SFInjectionProtocol.h
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#ifndef SFInjectionProtocol_h
#define SFInjectionProtocol_h

@protocol SFInjectionProtocol <NSObject>

/**
 监听，外部注入时触发
 
 @param identifier 唯一标识，业务自行定义
 @param params 参数信息
 */
- (void)observeWithIdentifier:(NSString *)identifier params:(NSDictionary *)params;

@end

#endif /* SFInjectionProtocol_h */
