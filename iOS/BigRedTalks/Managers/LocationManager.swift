//
//  LocationManager.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import Foundation
import CoreLocation
import SwiftUI

//NSObject is needed for CLLocationManagerDelegate
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @Published var location: CLLocationCoordinate2D?
    @Published var locationError: String = " \n "
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show alert letting them know this is off and should be on")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                locationError = "Your location is rectricted\nlikely due to parental controls"
            case .denied:
                locationError = "Go into your settings\nto change location access"
            case .authorizedAlways, .authorizedWhenInUse:
                location = locationManager.location!.coordinate
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
