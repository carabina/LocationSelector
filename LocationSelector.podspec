Pod::Spec.new do |s|

  s.name         = "LocationSelector"
  s.version      = "0.1.0"
  s.summary      = "This is a popup that let the user pick a location from a map."
  s.description  = <<-DESC
asdklfjsdlkfjadskjfhadksljfhasdkfjhadwfkhadklsfhadjkslfadsklfhasklfhaskljfhasdkljfhasdkljfhasdkljfhasdklfhadklshdsjklds fhsdkfs klf dfs
                   DESC

  s.swift_version = "4.1"
  s.homepage     = "https://github.com/ErosBonanni/LocationSelector"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Eros Bonanni" => "erosbonanni@icloud.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/ErosBonanni/LocationSelector.git", :tag => "0.1.0" }
  s.source_files  = "LocationSelector/**/*"
  s.frameworks = "UIKit"
  s.dependency "GoogleMaps"
  s.dependency "Nominatim"

end
