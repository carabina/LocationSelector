//
//  LocationSelector+Search.swift
//  LocationSelector
//
//  Created by Eros Bonanni on 23/05/2018.
//  Copyright © 2018 Eros Bonanni. All rights reserved.
//

import UIKit
import Nominatim

extension LocationSelector: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        guard let query = searchBar.text else { return }
        Nominatim.getLocation(fromAddress: query) { (result) in
            guard let result = result else { return }
            let address = "\(result.road ?? "") \(result.houseNumber ?? ""), \(result.city ?? ""), \(result.state ?? ""), \(result.country ?? "")"
            let location = Location(latitude: Double(result.latitude)!, longitude: Double(result.longitude)!, address: address)
            
            DispatchQueue.main.async {
                self.placeMarker(location)
                self.location = location
            }
            
        }
    }
    
}
