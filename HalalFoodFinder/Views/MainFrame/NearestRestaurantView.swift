//
//  NearestRestaurantView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 17/11/22.
//

import SwiftUI
import MapKit

struct NearestRestaurantView: View {
    @State private var text = ""
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.357107, longitude: 103.8194992), span: MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35))
    @State var data: [Restaurant]
    @StateObject var mapData = MapData()
       
    var body: some View {
      VStack {
         TextField("Enter an address", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
          
          Map(coordinateRegion: $mapData.region, annotationItems: mapData.location) { location in
              MapMarker(coordinate: location.coordinate, tint: Color.bgColor)
          }
         
      }
      .onAppear {
          mapData.getAllData(from: data, address: text)
      }
    }
}

struct NearestRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NearestRestaurantView(data: [Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500")])
    }
}
