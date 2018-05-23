//
//  LocationSelectorDelegate.swift
//  LocationSelector
//
//  Created by Eros Bonanni on 23/05/2018.
//  Copyright © 2018 Eros Bonanni. All rights reserved.
//

import Foundation

public protocol LocationSelectorDelegate: class {
    func locationSelected(location: Location)
    func locationSelectorDidCancel()
}
