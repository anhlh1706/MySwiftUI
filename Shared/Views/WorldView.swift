//
//  WorldView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 29/12/2020.
//

import MapKit
import SwiftUI

struct WorldView: View {
    
    @EnvironmentObject var locations: SharedLocation
    
    // Span: Zoom level, higher is more wide
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(
                    destination: DiscoverView(location: location),
                    label: {
                        Image(location.country)
                            .resizable()
                            .frame(width: 70, height: 40)
                    })
            }
        }
            .navigationTitle(Text("See the World"))
    }
}
