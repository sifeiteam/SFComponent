# SFComponent

SF基础框架

## 一、安装

pod 'SFComponent'

## 二、使用

### 1、SFComponent

组件基类，组件入口类继承它，并提供组件的能力

- SFAppDelegateProtocol

  应用生命周期，转发了UIAppllicationDelegate的方法到组件基类，使组件能够实现处理自己的事情。

- SFComponentLifeCycleProtocol

  组件的生命周期

- SFComponentRouteProtocol

  处理组件之间页面跳转

- SFComponentEventProtocol

  处理组件之间事件的响应

如果希望组件在App启动时就自动启动，只需要重写startupWhenAppLaunched，并返回YES即可。

```
+ (BOOL)startupWhenAppLaunched {
    return YES;
}
```

如果希望手动启动组件，调用以下方法

```
[[SFComponentManager sharedInstance] startupComponentWithName:componentName];
```

判断组件是否有效

```
BOOL isValid = [[SFComponentManager sharedInstance] isComponentValid:componentName];
```

判断组件是否已启动

```
BOOL isStartup = [[SFComponentManager sharedInstance] isComponentStartup:componentName];
```

### 2、SFRoute

提供组件之间页面跳转的能力

组件B在自己的入口类中实现SFComponentRouteProtocol协议中的goToPage方法，组件A调用[SFRoute goToComponent:page:] 方法后，将响应组件B实现的goToPage方法，组件B即可处理页面的跳转。

```
[SFRoute goToComponent:@"SFComponentB" page:@"b_page" viewController:self context:@{}];
```

```
- (BOOL)goToPage:(NSString *)page viewController:(UIViewController *)viewController context:(NSDictionary *)context {
    //在这里执行pushViewController或者presentViewController
    return YES;
}
```

### 3、SFEventCenter

提供组件之间用事件进行通信的能力。

组件B在自己的入口类中实现SFComponentEventProtocol协议中的responseEvent方法，组件A调用[SFEventCenter sendEvent:componentName:]方法后，将响应组件B的responseEvent方法。

```
id result = [SFEventCenter sendEvent:@"b_event" componentName:@"SFComponentB" context:@{} error:&error];
    
或

[SFEventCenter sendEvent:@"b_event" componentName:@"SFComponentB" context:@{} completion:^(id result) {
    
}];
```

```
- (id)responseEvent:(NSString *)eventName context:(NSDictionary *)context {
    //根据eventName处理对应的事件
    return @"ok";
}

- (void)asyncResponseEvent:(NSString *)eventName context:(NSDictionary *)context completion:(void (^)(id))completion {
    //根据eventName处理对应的事件
    completion(@"ok");
}
```



### 4、SFConfiguration

提供获取组件配置的接口，自定义配置文件必须放在 ***组件自己的Bundle->master->Config*** 下。

```
NSDictionary *tabs = [SFConfiguration configDictionaryWithFileName:@"Tab.plist" componentName:@"SFComponentA"];
```

### 5、SFServerConfig

提供获取服务器配置的接口，服务器配置必须配置在 ***组件自己的Bundle->master->Config->Server.plist*** 下。

```
NSString *server = [SFServerConfig serverWithKey:@"SFCOMPONENT_HOST" componentName:@"SFComponentA"];
```

### 6、SFLanguage

- 提供国际化接口，开发时文字不允许写死，必须通过该类的接口获取。

- 根据需要支持的语言创建对应的.lproj文件夹，文件夹名为语言代码，例如英文是en.lproj、zh-Hans.lproj。

- .lproj文件夹必须放在 ***组件自己的Bundle->master->Localized下*** 。

- 国际化文件Localizable.strings必须放在.lproj文件夹下。

- 在Localizable.strings文件中编写语言键值对，例如

```
"Title" = "标题";
```

调用以下接口获取当前设备语言的Title对应的语言文字

```
[SFLanguage localizedStringWithKey:@"Title" componentName:@"SFComponentA"];
```

### 7、SFColors

开发时颜色不允许写死，必须严格按照颜色规范表选取合适的颜色编号，然后调用该类接口获取颜色的实例。

```
UIColor *color = SFColorWithNumber(1);
```

### 8、SFFont

开发时字体不允许写死，必须严格按照字体规范表选取合适的字体编号，然后调用该类接口获取字体的实例。

```
UIFont *font = SFFontWithNumber(1);
```

### 9、SFImages

图片必须放在 ***组件自己的Bundle->master->Image下*** ，并通过该接口获取图片。

图片文件必须有@2x和@3x。

传入接口的图片名不要带@2x和@3x，必须带后缀。

```
UIImage *image = [SFImages imageWithName:@"image.png" componentName:@"SFComponentA"];
```

### 10、SFView

视图控件的基类，通用控件（例如轮播控件）必须继承该类，提供了与调用方双向通信的能力，避免直接依赖。

以SFTestView为例，该类继承SFView。调用SFTestView的对象我们暂时称为调用者。

- 必须重写viewWithClassName:context:方法，目的是提供SFTestView实例。

```
+ (instancetype)viewWithClassName:(NSString *)viewClassName context:(NSDictionary *)context {
    return [[SFTestView alloc] init];
}
```

- 可选择重写sendMessageFromCallerToView方法，目的是接收并处理调用者传递给SFTestView的消息。

```
- (void)sendMessageFromCallerToView:(NSDictionary *)message key:(NSString *)key {
    //处理
}
```

- 调用者可实现SFViewProtocol协议方法，从而实现接收SFTestView传递给调用者的消息

```
- (void)view:(SFView *)view key:(NSString *)key message:(NSDictionary *)message {
    
}
```

- SFTestView可调用sendMessageFromViewToCaller方法向调用者传递消息。

```
[SFTestView sendMessageFromViewToCaller:message key:key];
```

- 调用者调用SFView的viewWithClassName:context:方法获取SFTestView实例，并可在context中传递参数。

```
UIView *view = [SFView viewWithClassName:@"SFTestView" context:@{@"name":@"abc"}];
```

### 11、SFInjection

提供类之间注入信息的能力。

例如类A提供了注入信息的规范格式，并获取或监听其他类注入的信息，根据信息创建相应的视图等。

类B调用注入接口后，即可实现B中的信息在A中解析或展示。类A和类B可以跨组件。

```
//获取当前已注入的信息
NSArray *params = [[SFInjection sharedInstance] fetchInjectionParamsWithIdentifier:@"Injection_A_Identifier"];
//用params做相应处理

//也可以通过代理监听注入，实现动态处理
- (void)observeInjectionWithIdentifier:(NSString *)identifier params:(NSDictionary *)params {
    //用params做相应处理
}
```

```
//将参数信息注入到类A
NSDictionary *params = @{
    //参数
};
[[SFInjection sharedInstance] injectWithIdentifier:@"Injection_A_Identifier" params:params];
```

### 12、SFLog

Hook了NSLog，只有在DEBUG下才能打印出日志。

### 13、SFSandbox

提供组件的沙盒路径，每个组件只能在这个类提供的路径下读写文件。

```
NSString *documentPath = [SFSandbox documentRootPathWithComponentName:@"SFComponentA"];
NSString *libraryPath = [SFSandbox libraryRootPathWithComponentName:@"SFComponentA"];
NSString *cachesPath = [SFSandbox cachesRootPathWithComponentName:@"SFComponentA"];
NSString *tempPath = [SFSandbox tempRootPathWithComponentName:@"SFComponentA"];
```


