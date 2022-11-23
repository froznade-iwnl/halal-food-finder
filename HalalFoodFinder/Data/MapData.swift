//
//  MapData
//
//
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
    let coordinate: CLLocationCoordinate2D
}

class MapData: ObservableObject {
    
    @Published var location: [Location]
    @Published var region: MKCoordinateRegion
    
    init() {
        self.location = []
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.357107, longitude: 103.8194992), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
    func getMap(from data: Restaurant) {
        let location = CLLocationCoordinate2D(latitude: Double(data.latitude)!, longitude: Double(data.longitude)!)
        
        self.location.append(Location(coordinate: location))
        self.region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025))
        
        print(location)
    }
    
    func getAllData(from restaurants: [Restaurant], address: String) {
        self.location.removeAll()
        for restaurant in restaurants {
            let location = CLLocationCoordinate2D(latitude: Double(restaurant.latitude)!, longitude: Double(restaurant.longitude)!)
            self.location.append(Location(coordinate: location))
        }
        if address == "" {
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.357107, longitude: 103.8194992), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }else{
            getLocation(from: address) { location in
                self.region = MKCoordinateRegion(center: location ?? CLLocationCoordinate2D(latitude: 1.357107, longitude: 103.8194992), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
        }
    }
    
}

func getLocation(from address: String, completion: @escaping (_ location: CLLocationCoordinate2D?)-> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks,
            let location = placemarks.first?.location?.coordinate else {
                completion(nil)
                return
            }
            completion(location)
        }
    }
