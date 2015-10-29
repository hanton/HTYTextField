Pod::Spec.new do |s|

  s.name         = "HTYTextField"
  s.version      = "1.0"
  s.summary      = "A UITextField with bouncy placeholder."

  s.homepage     = "https://github.com/hanton/HTYTextField"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = "Hanton Yang"

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"


  s.source       = { :git => "https://github.com/hanton/HTYTextField.git", :tag => s.version.to_s }
  s.source_files = "HTYTextField/*.swift"
  s.module_name  = "HTYTextField"
  s.requires_arc = true

end
