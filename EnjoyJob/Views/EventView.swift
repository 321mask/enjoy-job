//
//  EventView.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 23.09.2024.
//

import SwiftUI
import MapKit

struct EventView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showAlert = false
    var eventImage: Image
    var title: String
    var text: String
    var subtitle: String
    var location: CLLocationCoordinate2D
    var mapTitle: String
    var body: some View {
        NavigationStack {
            VStack {
                Text(subtitle)
                    .font(.headline)
                    .bold()
                    .fontWeight(.heavy)
                
                eventImage
                    .resizable()
                    .aspectRatio(2.2, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(20)
                
                Text(text)
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    openMaps(for: title)
                }) {
                    Text(Image(systemName: "mappin.and.ellipse"))
                        .padding()
                        .background(Color(red: 0.3, green: 0.2, blue: 0.5))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                MapView(mapTitle: mapTitle, location: location)
                
                Button("Let's GOOOO!!!") {
                    showAlert = true
                }
                
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 120)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 40)
                    .fill(Color(red: 0.3, green: 0.2, blue: 0.5)))
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("You are in!"), dismissButton: .cancel(Text("OK")))
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: RateView()) {
                            ZStack {
                                Circle()
                                    .fill(Color(red: 0.3, green: 0.2, blue: 0.5))
                                    .frame(width: 40, height: 40) // Size of the star
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 2) // Border
                                    )
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white) // Text color
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text(title)
                            .font(.largeTitle) // Customize font
                    }
                }
            }
        }
    }
    private func openMaps(for eventTitle: String) {
        let address: String
        // Determine the address based on the event title
        switch eventTitle {
        case "Football":
            address = "3 Boulevard Michelet 13008 Marseille France"
        case "Theater":
            address = "30 Quai de Rive-Neuve 13007 Marseille France"
        case "Tennis":
            address = "789 Tennis Ave, New York, NY"
        default:
            address = "1 Infinite Loop, Cupertino, CA" // Default address or fallback
        }
        let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "https://maps.apple.com/?q=\(encodedAddress)")!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
#Preview {
    EventView(eventImage: Image("stadium"), title: "Football", text: "Unleash your competitive spirit and join us for a Friendly Football Match on September 15th at 3:00 PM. Whether you’re a pro or just a casual player, it’s the perfect opportunity to have fun, get active, and strengthen team bonds. An exciting afternoon awaits on the field! ⚽️🏆", subtitle: "Join Us for a Friendly Football Match!", location: CLLocationCoordinate2D(latitude: 43.269823, longitude: 5.395907), mapTitle: "Football Stadium")
}
