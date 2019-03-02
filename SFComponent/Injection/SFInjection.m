//
//  SFInjection.m
//  SFComponent
//
//  Created by XJY on 2019/3/2.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFInjection.h"

@interface SFInjection ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSHashTable *> *delegatesForIdentifier;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableArray<NSDictionary *> *> *injections;

@end

@implementation SFInjection

+ (instancetype)sharedInstance {
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

- (void)addDelegate:(id<SFInjectionProtocol>)delegate identifier:(nonnull NSString *)identifier {
    if (!delegate) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数delegate为空", NSStringFromSelector(_cmd)]);
        return;
    }
    if (!identifier || identifier.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数identifier为空", NSStringFromSelector(_cmd)]);
        return;
    }
    @synchronized (self) {
        NSHashTable *delegates = [self.delegatesForIdentifier objectForKey:identifier];
        if (!delegates) {
            delegates = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
            [self.delegatesForIdentifier setObject:delegates forKey:identifier];
        }
        if ([delegates containsObject:delegate]) {
            NSLog(@"%@", [NSString stringWithFormat:@"%@ delegate已存在", NSStringFromSelector(_cmd)]);
            return;
        }
        [delegates addObject:delegate];
    }
}

- (void)removeDelegate:(id<SFInjectionProtocol>)delegate identifier:(nonnull NSString *)identifier {
    if (!delegate) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数delegate为空", NSStringFromSelector(_cmd)]);
        return;
    }
    if (!identifier || identifier.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数identifier为空", NSStringFromSelector(_cmd)]);
        return;
    }
    @synchronized (self) {
        NSHashTable *delegates = [self.delegatesForIdentifier objectForKey:identifier];
        if (!delegates) {
            NSLog(@"%@", [NSString stringWithFormat:@"%@ delegate不存在", NSStringFromSelector(_cmd)]);
            return;
        }
        [delegates removeObject:delegate];
    }
}

- (void)removeAllDelegateWithIdentifier:(NSString *)identifier {
    if (!identifier || identifier.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数identifier为空", NSStringFromSelector(_cmd)]);
        return;
    }
    [self.delegatesForIdentifier removeObjectForKey:identifier];
}

- (NSArray<NSDictionary *> *)fetchInjectionParamsWithIdentifier:(NSString *)identifier {
    if (!identifier || identifier.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数identifier为空", NSStringFromSelector(_cmd)]);
        return nil;
    }
    @synchronized (self) {
        return [self.injections objectForKey:identifier];
    }
}

- (BOOL)injectWithIdentifier:(NSString *)identifier params:(NSDictionary *)params {
    if (!identifier || identifier.length == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数identifier为空", NSStringFromSelector(_cmd)]);
        return NO;
    }
    if (!params || params.count == 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 参数params为空", NSStringFromSelector(_cmd)]);
        return NO;
    }
    @synchronized (self) {
        NSMutableArray *items = [self.injections objectForKey:identifier];
        if (!items) {
            items = [[NSMutableArray alloc] init];
            [self.injections setObject:items forKey:identifier];
        }
        if ([items containsObject:params]) {
            return YES;
        }
        [items addObject:params];
        
        NSHashTable *delegates = [self.delegatesForIdentifier objectForKey:identifier];
        for (id <SFInjectionProtocol> delegate in delegates) {
            if (delegate && [delegate respondsToSelector:@selector(observeWithIdentifier:params:)]) {
                [delegate observeWithIdentifier:identifier params:params];
            }
        }
        
        return YES;
    }
}

#pragma mark - Private

- (NSMutableDictionary<NSString *,NSHashTable *> *)delegatesForIdentifier {
    if (!_delegatesForIdentifier) {
        _delegatesForIdentifier = [[NSMutableDictionary alloc] init];
    }
    return _delegatesForIdentifier;
}

- (NSMutableDictionary<NSString *,NSMutableArray<NSDictionary *> *> *)injections {
    if (!_injections) {
        _injections = [[NSMutableDictionary alloc] init];
    }
    return _injections;
}

@end
