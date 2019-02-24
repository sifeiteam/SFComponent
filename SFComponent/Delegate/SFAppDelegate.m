//
//  SFAppDelegate.m
//  SFComponent
//
//  Created by XJY on 2019/2/23.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFAppDelegate.h"
#import <objc/message.h>
#import "SFComponentManager.h"

@interface SFAppDelegate ()

@end

@implementation SFAppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        //强制启动
    }
    return self;
}

- (BOOL)forwardSEL:(SEL)sel toBlock:(void (^)(id sender, SEL sel))block {
    BOOL success = NO;
    NSArray *components = [SFComponentManager sharedInstance].components.allValues;
    for (id component in components) {
        if (![component respondsToSelector:sel]) {
            continue;
        }
        if (block) {
            block(component, sel);
            success = YES;
        }
    }
    return success;
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((BOOL (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, launchOptions);
    }];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((BOOL (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, launchOptions);
    }];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((BOOL (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, url);
    }];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((BOOL (*)(id, SEL, id, id, id, id))(void *)objc_msgSend)(sender, sel, application, url, sourceApplication, annotation);
    }];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((BOOL (*)(id, SEL, id, id, id))(void *)objc_msgSend)(sender, sel, app, url, options);
    }];
    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, UIInterfaceOrientation, NSTimeInterval))(void *)objc_msgSend)(sender, sel, application, newStatusBarOrientation, duration);
    }];
}

- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, UIInterfaceOrientation))(void *)objc_msgSend)(sender, sel, application, oldStatusBarOrientation);
    }];
}

- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, CGRect))(void *)objc_msgSend)(sender, sel, application, newStatusBarFrame);
    }];
}

- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, CGRect))(void *)objc_msgSend)(sender, sel, application, oldStatusBarFrame);
    }];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings  API_AVAILABLE(ios(8.0)){
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, notificationSettings);
    }];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, deviceToken);
    }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, error);
    }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, userInfo);
    }];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, notification);
    }];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id, id))(void *)objc_msgSend)(sender, sel, application, identifier, notification, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler();
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id, id, id))(void *)objc_msgSend)(sender, sel, application, identifier, userInfo, responseInfo, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler();
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id, id))(void *)objc_msgSend)(sender, sel, application, identifier, userInfo, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler();
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id, id, id))(void *)objc_msgSend)(sender, sel, application, identifier, notification, responseInfo, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler();
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id))(void *)objc_msgSend)(sender, sel, application, userInfo, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler(UIBackgroundFetchResultFailed);
        }
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id))(void *)objc_msgSend)(sender, sel, application, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler(UIBackgroundFetchResultFailed);
        }
    }
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id))(void *)objc_msgSend)(sender, sel, application, shortcutItem, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler(NO);
        }
    }
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id))(void *)objc_msgSend)(sender, sel, application, identifier, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler();
        }
    }
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id))(void *)objc_msgSend)(sender, sel, application, userInfo, reply);
    }];
}

- (void)applicationShouldRequestHealthAuthorization:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)application:(UIApplication *)application handleIntent:(INIntent *)intent completionHandler:(void(^)(INIntentResponse *intentResponse))completionHandler {
    BOOL success = [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id, id, id))(void *)objc_msgSend)(sender, sel, application, intent, completionHandler);
    }];
    if (!success) {
        if (completionHandler) {
            completionHandler(nil);
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application {
    [self forwardSEL:_cmd toBlock:^(id sender, SEL sel) {
        ((void (*)(id, SEL, id))(void *)objc_msgSend)(sender, sel, application);
    }];
}

@end
