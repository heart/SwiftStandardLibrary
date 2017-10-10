#
#  Be sure to run `pod spec lint SwiftStandardLibrary.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SwiftStandardLibrary"
  s.version      = "0.1.2"
  s.summary      = "A collection of data structures and algorithms currently absent in Swift."

  s.homepage     = "https://github.com/tdkirtland/SwiftStandardLibrary"
  
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author       = "Tyler Kirtland"

  s.ios.deployment_target = "9.3"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.1"
  s.tvos.deployment_target = "9.2"

  s.source       = { :git => "https://github.com/tdkirtland/SwiftStandardLibrary.git", :tag => "0.1.2" }
  s.source_files = "Sources/*.swift"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
