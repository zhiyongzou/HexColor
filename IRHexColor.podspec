#
#  Be sure to run `pod spec lint IRHexColor.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "IRHexColor"
  spec.version      = "0.0.5"
  spec.summary      = "A convenient way to convert hex strings to UIColor or NSColor"
  spec.homepage     = "https://github.com/zhiyongzou/HexColor"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "zzyong" => "scauzouzhiyong@163.com" }
  spec.source       = { :git => "https://github.com/zhiyongzou/HexColor.git", :tag => spec.version }
  spec.swift_versions = "5.0"
  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.9"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.source_files  = "HexColor/*.swift"

end
