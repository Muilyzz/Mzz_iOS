#
# Be sure to run `pod lib lint Mzz.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Mzz'
  s.version          = '0.1.0'
  s.summary          = 'iOS/Android Common UI Framework by Muilyzz Corp.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iOS/Android Common UI Framework.
This framework defines same member variables & functions to make developers can write almost same platform-independent code.
(Swift & Kotlin have only few minor differences.)
                       DESC

  s.homepage         = 'https://github.com/Muilyzz/Mzz_iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yongseok Kim' => 'yongseok.kim@muilyzz.com' }
  s.source           = { :git => 'https://github.com/Muilyzz/Mzz_iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Mzz/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Mzz' => ['Mzz/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  #s.dependency 'Firebase/Core'
  #s.dependency 'Firebase'
  #s.static_framework = true
  #s.ios.static_framework = 'Firebase/Core'
  #s.libraries = 'Firebase/Core'
  #s.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/Firebase/Core/Sources' }
  
end
