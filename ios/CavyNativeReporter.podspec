package = JSON.parse(File.read(File.join(__dir__, (File.join('..', 'package.json')))))

Pod::Spec.new do |s|
  s.name         = "CavyNativeReporter"
  s.version      = package["version"]
  s.description  = package["description"]
  s.summary      = s.name
  s.homepage     = "https://github.com/pixielabs/cavy-native-reporter"
  s.license      = package["license"]
  s.author       = { "author" => "dev@pixielabs.io" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/pixielabs/cavy-native-reporter.git", :tag => "v#{s.version}" }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true
  s.dependency "React-Core"
end
