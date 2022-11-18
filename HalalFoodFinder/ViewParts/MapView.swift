//
//  MapView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var address: String
    @StateObject private var mapAPI = MapAPI()
        

    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) { location in
                    MapMarker(coordinate: location.coordinate, tint: .red)
                }
            
        }
        .onAppear {
            mapAPI.getLocation(address: address, delta: 0.0025)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(address: "CHANGI AIRPORT TERMINAL 3, 65 AIRPORT BOULEVARD, B2-02, 819663, Singapore")
    }
}
