Pod::Spec.new do |s|

  s.name         = "HTYTextField"
  s.version      = "1.1"
  s.summary      = "A UITextField with bouncy placeholder."

  s.homepage     = "https://github.com/hanton/HTYTextField"
#  s.screenshots  = "https://github.com/hanton/HTYTextField/blob/master/screenshot/HTYTextField.gif"

  s.license      = "MIT"

  s.author       = { "Hanton Yang" => "hanton.yang@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/hanton/HTYTextField.git", :tag => s.version.to_s }
  s.source_files = "HTYTextField/*.swift"
  s.requires_arc = true

end
