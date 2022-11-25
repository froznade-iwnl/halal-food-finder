//
//  LocationDataManager.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 23/11/22.
//

import Foundation
import MapKit

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.357107, longitude: 103.8194992), span: MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35))
    
    var locationManager: CLLocationManager?
    @Published var myLocation: CLLocation?
    
    func checkIfLocationsServiceIsEnabled(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            var lat = locationManager!.location!.coordinate.latitude
            var lon = locationManager!.location!.coordinate.longitude
            myLocation = CLLocation(latitude: lat, longitude: lon)
        }else{
            print("Show alert to tell that the setting is still off and go turn it on")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location might be restricted due to parental controls")
        case .denied:
            print("You have denied this app location permission. Please go to the settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
