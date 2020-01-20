
Pod::Spec.new do |s|
  s.name         = "CavyNativeReporter"
  s.version      = "0.1.0"
  s.summary      = "CavyNativeReporter"
  s.description  = <<-DESC
                  CavyNativeReporter - A native test reporter for Cavy
                   DESC
  s.homepage     = "https://github.com/pixielabs/cavy-native-reporter"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/CavyNativeReporter.git", :tag => "master" }
  s.source_files  = "CavyNativeReporter/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end
