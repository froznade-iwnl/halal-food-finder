//
//  MapModel.swift
//  MapBusiness
//
//  Created by Federico on 26/02/2022.
//  Edited by Raditya
//

import Foundation
import MapKit
import CoreLocation
import Combine


// Address Data Model
struct Address: Codable {
   let data: [Datum]
}

struct Datum: Codable {
   let latitude, longitude: Double
   let name: String?
}

// Our Pin Locations
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

class MapAPI: ObservableObject{
   private let BASE_URL = "http://api.positionstack.com/v1/forward"
   private let API_KEY = "92d0989cebd26dea67f59db3a280d7a6"
   
   @Published var region: MKCoordinateRegion
    @Published var coordinates: CLLocation
   @Published var locations: [Location] = []
    @Published var distance: Double
   
   
   init() {
      // Defualt Info
      self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
      
      self.coordinates = CLLocation(latitude: 1.298400, longitude: 103.787920)
       
       self.distance = 0
       
      self.locations.insert(Location(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)), at: 0)
       
   }
   
   // API request
    func getLocation(address: String, delta: Double) {
        let pAddress = address.replacingOccurrences(of: " ", with: "%20")
        let url_string = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress)"
        
        guard let url = URL(string: url_string) else {
            print("Invalid URL")
            return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print(error!.localizedDescription)
                return }
            
            guard let newCoordinates = try? JSONDecoder().decode(Address.self, from: data) else { return }
            
            if newCoordinates.data.isEmpty {
                print("Could not find address...")
                return
            }
            
            // Set the new data
            DispatchQueue.main.async {
                let details = newCoordinates.data[0]
                let lat = details.latitude
                let lon = details.longitude
                
                self.coordinates = CLLocation(latitude: lat, longitude: lon)
                self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
                
                let new_location = Location(name: "\(details.name)", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                
                self.locations.removeAll()
                self.locations.insert(new_location, at: 0)
                self.distance = self.coordinates.distance(from: CLLocation(latitude: 1.2998, longitude: 103.7876))
                
                
                print("Successfully loaded location! \(details.name)")
            }
        }
        .resume()
    }
    
    
    func getLocationof2Points(address: String, delta: Double, myLocation: String) {
        let pAddress = address.replacingOccurrences(of: " ", with: "%20")
        let pAddress2 = myLocation.replacingOccurrences(of: " ", with: "%20")
        let url_string = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress)"
        let url_location = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress2)"
   
      guard let url = URL(string: url_string) else {
         print("Invalid URL")
         return }
      
        guard let urlLocation  = URL(string: url_location) else {
            print("invalid url")
            return }
        
      URLSession.shared.dataTask(with: url) { (data, response, error) in
         guard let data = data else {
            print(error!.localizedDescription)
            return }
         
         guard let newCoordinates = try? JSONDecoder().decode(Address.self, from: data) else { return }
         
         if newCoordinates.data.isEmpty {
            print("Could not find address...")
            return
         }
         
         // Set the new data
         DispatchQueue.main.async {
            let details = newCoordinates.data[0]
            let lat = details.latitude
            let lon = details.longitude
            
            self.coordinates = CLLocation(latitude: lat, longitude: lon)
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
            
            let new_location = Location(name: "\(details.name)", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
          
            self.locations.removeAll()
            self.locations.insert(new_location, at: 0)
             
            
            print("Successfully loaded location! \(details.name)")
         }
      }
      .resume()
        
        URLSession.shared.dataTask(with: urlLocation) { (data, response, error) in
           guard let data = data else {
              print(error!.localizedDescription)
              return }
           
           guard let newCoordinates = try? JSONDecoder().decode(Address.self, from: data) else { return }
           
           if newCoordinates.data.isEmpty {
              print("Could not find address...")
              return
           }
           
           // Set the new data
           DispatchQueue.main.async {
              let details = newCoordinates.data[0]
              let lat = details.latitude
              let lon = details.longitude
              
              self.coordinates = CLLocation(latitude: lat, longitude: lon)
              self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
              
              let new_location = Location(name: "\(details.name)", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
              self.locations.append(new_location)
              
              print("Successfully loaded location! \(details.name)")
           }
        }
        .resume()
   }
}



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

   
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
}
