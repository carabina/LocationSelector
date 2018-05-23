//
//  LocationUtils.swift
//  LocationSelector
//
//  Created by Eros Bonanni on 23/05/2018.
//  Copyright © 2018 Eros Bonanni. All rights reserved.
//

import UIKit

extension UIView {
    
    public func addSubviewsForAutoLayout(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
}
