# 涂鸦智能 iOS Camera Panel SDK 

[中文版](README-zh.md) | [English](README.md)

---

## 功能概述

涂鸦智能 iOS Camera Panel SDK（ TuyaCameraPanelSDK ）是基于 [Tuya Smart Camera SDK](<https://tuyainc.github.io/tuyasmart_camera_ios_sdk_doc/>) 开发的一系列摄像机功能相关的面板 SDK。主要包括以下功能：

- 预览面板，回放面板，云存储面板，消息中心面板，相册面板，设置面板。

## 快速集成

### 使用 CocoaPods 集成

在  ```Podfile``` 文件中加入以下代码：

```ruby
source "https://github.com/TuyaInc/TYPublicSpecs.git"
source 'https://cdn.cocoapods.org/'

platform :ios, '9.0'

target 'TuyaSmartCameraPanelSDK_Example' do
  pod 'TuyaSmartCameraPanelSDK'
  pod 'TuyaSmartHomeKit'
  pod "TuyaSmartPanelSDK"
  
end
```

然后在项目根目录下执行 ```pod update``` 命令，集成第三方库。

CocoaPods 的使用请参考：[CocoaPods Guides](https://guides.cocoapods.org/)

## 项目配置

在对应 Target 中，选择 ```Build Settings```，搜索  ```Enable Bitcode```，设置为 ```NO```。

## 集成 SDK

### 头文件导入

Objective-C 项目在需要使用的地方添加

```objective-c
#import <TuyaSmartCameraPanelSDK/TuyaSmartCameraPanelSDK.h>
```

Swift 请在  `xxx_Bridging-Header.h`  桥接文件中添加以下内容

```swift
#import <TuyaSmartCameraPanelSDK/TuyaSmartCameraPanelSDK.h>
```

然后在项目需要使用的地方添加

```swift
import TuyaSmartCameraPanelSDK
```
## 开发文档

更多请参考: [涂鸦文档中心 - iOS SDK使用说明](https://tuyainc.github.io/tuyasmart_camera_panel_ios_sdk_doc/zh-hans/)

