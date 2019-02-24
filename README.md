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
