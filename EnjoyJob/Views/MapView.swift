//
//  MapView.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 23.09.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .automatic
    var mapTitle: String
    var location: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.269823, longitude: 5.395907), // San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        NavigationStack {
            VStack {
                Map(position: $position) {
                    Annotation(mapTitle, coordinate: location) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.5))
                            .font(.title)
                            .onAppear() {
                                position = .camera(
                                    MapCamera(
                                        centerCoordinate: location, distance: 980, heading: 242, pitch: 60))
                            }
                    }
                }
                .aspectRatio(2.5, contentMode: .fill)
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

#Preview {
    MapView(mapTitle: "Football", location: .init(latitude: 40.7127, longitude: -74.0059))
}
