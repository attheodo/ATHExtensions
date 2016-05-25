Pod::Spec.new do |s|
  s.module_name      = 'ATHExtensions'
  s.name             = 'ATHExtensions'
  s.version          = '1.0.0'
  s.summary          = 'A collection of useful extensions for Swift classes and utilities I use often in my projects'
  s.description      = <<-DESC
A collection of useful extensions for Swift classes and utilities I use often in my projects
                       DESC

  s.homepage         = 'https://github.com/attheodo/ATHExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'attheodo' => 'at@atworks.gr' }
  s.source           = { :git => 'https://github.com/attheodo/ATHExtensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/attheodo'

  s.ios.deployment_target = '8.0'
  s.source_files = 'ATHExtensions/*.swift'

end
