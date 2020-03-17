# Tuya Smart iOS Camera Panel SDK

[中文版](README-zh.md) | [English](README.md)

---

## Functional Overview

Tuya Smart iOS Camera Panel SDK (TuyaCameraPanelSDK) is a series of panel SDK related to camera functions developed based on [Tuya Smart Camera SDK](<https://tuyainc.github.io/tuyasmart_camera_ios_sdk_doc/>). It mainly includes the following functions:

-Preview panel, playback panel, cloud storage panel, message center panel, album panel, settings panel.

## Quick integration

### Use CocoaPods integration

Add the following code to the ```Podfile``` file:

```ruby
source "https://github.com/TuyaInc/TYPublicSpecs.git"
source 'https://cdn.cocoapods.org/'

platform: ios, '9.0'

target 'TuyaSmartCameraPanelSDK_Example' do
  pod 'TuyaSmartCameraPanelSDK'
  pod 'TuyaSmartHomeKit'
  pod "TuyaSmartPanelSDK"
  
end
```

Then execute the ``pod update`` command in the project root directory to integrate third-party libraries.

Please refer to the use of CocoaPods: [CocoaPods Guides](https://guides.cocoapods.org/)

## Project configuration

In the corresponding Target, select  ``Build Settings``, search for  ``Enable Bitcode``, and set it to ``NO``.

## Integration SDK

### Header file import

Objective-C projects are added where needed

```objective-c
#import <TuyaSmartCameraPanelSDK/TuyaSmartCameraPanelSDK.h>
```

Swift Please add the following to the `xxx_Bridging-Header.h` bridge file

```swift
#import <TuyaSmartCameraPanelSDK/TuyaSmartCameraPanelSDK.h>
```

Then add it where the project needs to be used

```swift
import TuyaSmartCameraPanelSDK
```
## Doc

Refer to details: [Tuya Smart Doc - iOS SDK](https://tuyainc.github.io/tuyasmart_camera_panel_ios_sdk_doc/en/)
