//
//  LocationManger.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import Foundation
import CoreLocation
import SwiftUI

//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    let manager = CLLocationManager()
//
//    @Published var location: CLLocationCoordinate2D?
//    @Published var isLoading = false
//
//
//    override init() {
//        super.init()
//        manager.delegate = self
//    }
//
//    func requestLocation() {
//        isLoading = true
//        manager.requestLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        location = locations.first?.coordinate
//        isLoading = false
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
//        print("Error getting location", error)
//        isLoading = false
//    }
//}

//NSObject is needed for CLLocationManagerDelegate
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @Published var location: CLLocationCoordinate2D?
//    @Published var isLoading = false
    
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
                print("Your location is rectricted likely due to parental controls")
            case .denied:
                print("You have denied this app location permission. Go into settings to change it")
            case .authorizedAlways, .authorizedWhenInUse:
                location = locationManager.location!.coordinate
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        location = locations.first?.coordinate
//        isLoading = false
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
//        print("Error getting location", error)
//        isLoading = false
//    }
}
