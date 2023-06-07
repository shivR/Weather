# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

def test_pods
  pod 'Quick'
  pod 'Nimble'
end

def app_pods
  pod 'SwiftLint'
  pod 'MBProgressHUD', '~> 1.2.0'
  pod 'SwiftIcons', '~> 3.0'
end

target 'Weather App' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Weather App
  app_pods

  target 'Weather App Tests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end

  target 'Weather App UITests' do
    inherit! :search_paths
    # Pods for testing
    app_pods
    test_pods
  end
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end
