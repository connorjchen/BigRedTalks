//
//  LocationManger.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import Foundation
import CoreLocation
import SwiftUI

//NSObject is needed for CLLocationManagerDelegate
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @Published var location: CLLocationCoordinate2D?
    @Published var locationError: String = ""
    
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
                locationError = "Your location is rectricted likely due to parental controls"
            case .denied:
                locationError = "You have denied this app location permission"
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
