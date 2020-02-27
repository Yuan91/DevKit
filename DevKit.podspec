Pod::Spec.new do |s|
  s.name             = 'DevKit'
  s.version          = '0.1.0'
  s.summary          = 'iOS 开发常用工具类'
  s.platform = :ios

  s.description      = <<-DESC
iOS 开发常用工具类.包含:UIButton工厂类,调整Button图文布局,便捷设置UITableView占位图,GCD定时器,高精度计算等功能
                       DESC

  s.homepage         = 'https://github.com/Yuan91/DevKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yuan91' => 'smartdy@yeah.net' }
  s.source           = { :git => 'https://github.com/Yuan91/DevKit.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'DevKit/Classes/**/*'
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
