Pod::Spec.new do |s|

  s.name         = "LocationSelector"
  s.version      = "0.1.1"
  s.summary      = "Popup with a Google Map View to select location."
  s.description  = <<-DESC
A popup controller with a Google Map View that lets the user pick a direction
                   DESC

  s.swift_version = "4.1"
  s.homepage     = "https://github.com/ErosBonanni/LocationSelector"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Eros Bonanni" => "erosbonanni@icloud.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/ErosBonanni/LocationSelector.git", :tag => "0.1.1" }
  s.static_framework = true
  s.source_files  = "LocationSelector/**/*"
  s.frameworks = "UIKit"
  s.dependency "GoogleMaps"
  s.dependency "Nominatim"

end
