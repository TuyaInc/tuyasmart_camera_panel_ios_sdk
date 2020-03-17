Pod::Spec.new do |s|
  s.name = "TuyaSmartCameraPanelSDK"
  s.version = "0.3.0"
  s.summary = "A short description of TuyaSmartCameraPanelSDK."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"TuyaInc"=>"https://www.tuya.com"}
  s.homepage = "https://github.com/TuyaInc"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :http => "https://airtake-public-data-1254153901.cos.ap-shanghai.myqcloud.com/smart/app/package/sdk/ios/#{s.name}-#{s.version}.zip", :type => "zip" }
  s.static_framework = true

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/*.framework'

  s.dependency 'TYCameraSettingModule'
  s.dependency 'TYCameraPanelModule'
  s.dependency 'TYCameraRNPanelModule'
  s.dependency 'TYDomainQueryModule'
  s.dependency 'TYHybridContainer'
  s.dependency 'TYLanguageBundleRegister'
  s.dependency 'TuyaRNApi/IPC'
end