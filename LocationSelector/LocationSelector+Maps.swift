//
//  LocationSelector+Maps.swift
//  LocationSelector
//
//  Created by Eros Bonanni on 23/05/2018.
//  Copyright © 2018 Eros Bonanni. All rights reserved.
//

import GoogleMaps
import Foundation

extension LocationSelector {
    
    func placeMarker(_ location: Location) {
        mapView.clear()
        let coordinates = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let marker = GMSMarker(position: coordinates)
        marker.title = location.address
        marker.map = mapView
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 15)
        mapView.camera = camera
    }
    
}
