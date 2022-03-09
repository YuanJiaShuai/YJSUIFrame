 #
# Be sure to run `pod lib lint YJSUIFrame.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'YJSUIFrame'
    s.version          = '1.0.2'
    s.summary          = '常用的UI框架'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/YuanJiaShuai/YJSUIFrame'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'YuanJiaShuai' => '1361253662@qq.com' }
    s.source           = { :git => 'https://github.com/YuanJiaShuai/YJSUIFrame.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '9.0'
    
    s.source_files = 'YJSUIFrame/Classes/YJSUIFrame.h'
    
    s.subspec 'YJSCategory' do |ss|
        ss.source_files = 'YJSUIFrame/Classes/YJSCategory/*.*'
    end
    
    s.subspec 'YJSProgressHUD' do |ss|
        ss.source_files = 'YJSUIFrame/Classes/YJSProgressHUD/*.*'
        ss.resources = 'YJSUIFrame/Classes/YJSProgressHUD/YJSProgressHUD.bundle'
    end
    
    s.frameworks = 'Foundation', 'UIKit'
    s.dependency 'SVProgressHUD'
end
