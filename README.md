# LocationSelector

A popup controller with a Google Map View that lets the user pick a direction

## Usage

First, you have to present the View Controller and set the delegate

```swift

let locationSelector = LocationSelector()
locationSelector.delegate = self
locationSelector.appearance.textColor = .white
locationSelector.appearance.title = "Location"
present(locationSelector, animated: true)

```

The delegate has two simple functions

```swift
func locationSelected(location: Location) {
  print(location.latitude)
  print(location.longitude)
  print(location.address)
}

func locationSelectorDidCancel() {
  print( ":(" )
}
```

You can customize the popup and the map style

```swift

locationSelector.appearance.primaryColor = .purple
locationSelector.appearance.buttonTitle = "Select"
locationSelector.appearance.mapStyle = GMSMapStyle(contentsOfFileURL: "URL")

```

## Installation

### Cocoapods
CocoaPods is a dependency manager for Cocoa projects. To install LocationSelector with CocoaPods:

Make sure CocoaPods is installed and update your Podfile

```
use_frameworks!

target 'YourAppTargetName' do
    pod 'LocationSelector'
end
```

