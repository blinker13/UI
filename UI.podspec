Pod::Spec.new do |s|
  s.name             = "UI"
  s.version          = "0.0.1"
  s.summary          = "Cross platform UI framework for Mac and iOS"
  s.homepage         = "https://github.com/blinker13/UI"
  s.license          = 'MIT'
  s.author           = { }
  s.source           = { :git => "https://github.com/blinker13/UI.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/blinker13'
  s.requires_arc = true

  s.tvos.deployment_target = '9.0'
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = '9.0'

  s.source_files = ['Sources/Geometry/**/*.{swift}']
end
