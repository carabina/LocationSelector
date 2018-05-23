//
//  LocationSelectorSettings.swift
//  LocationSelector
//
//  Created by Eros Bonanni on 23/05/2018.
//  Copyright © 2018 Eros Bonanni. All rights reserved.
//

import UIKit
import GoogleMaps

public struct LocationSelectorAppearance {
    
    public var primaryColor: UIColor = UIColor(red: 119/255, green: 110/255, blue: 217/255, alpha: 1)
    public var textColor: UIColor = .white
    public var mapStyle: GMSMapStyle? = nil
    public var title: String = "Location"
    public var buttonTitle: String = "Select"
    
}
