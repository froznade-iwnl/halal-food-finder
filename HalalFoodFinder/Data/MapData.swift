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
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
    
    func getMap(from address: String) {
        getLocation(from: address) { location in
            if let location = location {
                self.location.append(Location(coordinate: location))
                self.region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025))
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
