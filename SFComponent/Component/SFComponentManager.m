//
//  SFComponentManager.m
//  SFComponent
//
//  Created by XJY on 2019/2/24.
//

#import "SFComponentManager.h"
#import "SFComponent.h"

@interface SFComponentManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, SFComponent *> *allComponents;

@end

@implementation SFComponentManager

+ (instancetype)sharedInstance {
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

- (NSMutableDictionary<NSString *, SFComponent *> *)allComponents {
    if (!_allComponents) {
        _allComponents = [[NSMutableDictionary alloc] init];
    }
    return _allComponents;
}

- (BOOL)startupComponentWithName:(NSString *)name error:(NSError *__autoreleasing *)error {
    if (!name || name.length == 0) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"参数name为空"}];
        }
        return NO;
    }
    SFComponent *component = [self.allComponents objectForKey:name];
    if (component) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : [NSString stringWithFormat:@"组件%@已启动，无需再次启动", name]}];
        }
        return NO;
    }
    
    Class cls = NSClassFromString(name);
    if (![cls isSubclassOfClass:[SFComponent class]]) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : [NSString stringWithFormat:@"组件入口类%@非SFComponent的子类", name]}];
        }
        return NO;
    }

    component = [[cls alloc] init];
    if (!component) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"组件初始化失败"}];
        }
        return NO;
    }
    @synchronized (self) {
        [self.allComponents setObject:component forKey:name];
    }
    if ([component respondsToSelector:@selector(didFinishStartup)]) {
        [component didFinishStartup];
    }
    return YES;
}

- (BOOL)removeComponentWithName:(NSString *)name error:(NSError *__autoreleasing *)error {
    if (!name || name.length == 0) {
        if (error) {
            *error = [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:@{@"reason" : @"参数name为空"}];
        }
        return NO;
    }
    SFComponent *component = [self.allComponents objectForKey:name];
    if (!component) {
        return YES;
    }
    if ([component respondsToSelector:@selector(willBeRemoved)]) {
        [component willBeRemoved];
    }
    @synchronized (self) {
        [self.allComponents removeObjectForKey:name];
    }
    
    return YES;
}

- (NSDictionary<NSString *,SFComponent *> *)components {
    @synchronized (self) {
        return [self.allComponents copy];
    }
}

@end
