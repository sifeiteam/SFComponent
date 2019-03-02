# SFComponent

SF基础框架

## 一、安装

pod 'SFComponent'

## 二、使用

### SFComponent

组件基类，组件入口类继承它，并提供组件的能力

- SFAppDelegateProtocol

  应用生命周期，转发了UIAppllicationDelegate的方法到组件基类，使组件能够实现处理自己的事情。

- SFComponentLifeCycleProtocol

  组件的生命周期

- SFComponentRouteProtocol

  处理组件之间页面跳转

- SFComponentEventProtocol

  处理组件之间事件的响应

### SFRoute

提供组件之间页面跳转的能力

组件B在自己的入口类中实现SFComponentRouteProtocol协议中的goToPage方法，组件A调用[SFRoute goToComponent:page:] 方法后，将响应组件B实现的goToPage方法，组件B即可处理页面的跳转。

### SFEventCenter

提供组件之间用事件进行通信的能力。

组件B在自己的入口类中实现SFComponentEventProtocol协议中的responseEvent方法，组件A调用[SFEventCenter sendEvent:componentName:]方法后，将响应组件B的responseEvent方法。

### SFConfiguration

提供获取组件配置的接口，自定义配置文件必须放在组件自己的Bundle->master->Config下。

### SFServerConfig

提供获取服务器配置的接口，服务器配置必须配置在组件自己的Bundle->master->Config->Server.plist下。

### SFLanguage

国际化接口，开发时文字不允许写死，必须通过该类的接口获取。国际化文件必须放在组件自己的Bundle->master->Localized下。

### SFColors

开发时颜色不允许写死，必须严格按照颜色规范表选取合适的颜色编号，然后调用该类接口获取颜色的实例。

### SFFont

开发时字体不允许写死，必须严格按照字体规范表选取合适的字体编号，然后调用该类接口获取字体的实例。

### SFImages

图片必须放在组件自己的Bundle->master->Image下，并通过该接口获取图片。

### SFView

视图控件的基类，通用控件（例如轮播控件）必须继承该类，提供了与调用方双向通信的能力，避免直接依赖。

### SFInjection

提供类之间注入信息的能力，例如类A提供了注入信息的规范格式，并获取或监听其他类注入的信息，根据信息创建相应的视图等。类B调用注入接口后，即可实现B中的信息在A中解析或展示。类A和类B可以跨组件。

### SFLog

Hook了NSLog，只有在DEBUG下才能打印出日志。
