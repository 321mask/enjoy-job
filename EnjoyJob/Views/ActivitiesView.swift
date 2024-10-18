//
//  ActivitiesView.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 20.09.2024.
//

import SwiftUI
import MapKit

struct ActivitiesView: View {
    
    @State var activities: [Activity] = [
        Activity(title: "Football", image: Image("foot"), city: "Marseille", date: Date(timeIntervalSinceNow: 86400 * 5), description: "Unleash your competitive spirit and join us for a Friendly Football Match on October 1st at 3:00 PM. Whether you’re a pro or just a casual player, it’s the perfect opportunity to have fun, get active, and strengthen team bonds. An exciting afternoon awaits on the field! ⚽️🏆", subTitle: "Join Us for a Friendly Football Match!", eventImage: Image("stadium"), location: CLLocationCoordinate2D(latitude: 43.269823, longitude: 5.395907), mapTitle: "Orange Vélodrome"),
        
        Activity(title: "Theater", image: Image("theatre"), city: "Paris", date: Date(timeIntervalSinceNow: 86400 * 10), description: "Join us for an enchanting evening of theater as we watch “Beauty and the Beast” on October 6th at 7:00 PM. Escape into a world of magic, love, and adventure with this timeless classic. It’s the perfect chance to unwind and enjoy a cultural experience! 🎭✨", subTitle: "Experience the Magic of 'Beauty and the Beast' Together!", eventImage: Image("theatre2"), location: CLLocationCoordinate2D(latitude: 43.292490, longitude: 5.367854), mapTitle: "Théâtre de la Criée"),
        
        Activity(title: "Cooking Workshop", image: Image("atelierCuisine2"), city: "Marseille", date: Date(timeIntervalSinceNow: 86400 * 15), description: "Join us for a cooking workshop on October 10th at 6:00 PM. Learn how to prepare authentic Provençal dishes with a local chef in a warm and friendly atmosphere. A great opportunity to discover new recipes while meeting fellow food lovers! 🍳🌿", subTitle: "Discover the Flavors of Provence!", eventImage: Image("atelierCuisine"), location: CLLocationCoordinate2D(latitude: 43.296482, longitude: 5.36978), mapTitle: "Cooking Workshop in Marseille"),
        
        Activity(title: "Yoga Session", image: Image("yoga"), city: "Marseille", date: Date(timeIntervalSinceNow: 86400 * 20), description: "Relax during an outdoor yoga session at Parc Borély on October 15th at 9:00 AM. Enjoy a moment of serenity and well-being in the heart of nature. Whether you are a beginner or advanced, all are welcome! 🧘♀️🌳", subTitle: "Reconnect with Nature!", eventImage: Image("yoga2"), location: CLLocationCoordinate2D(latitude: 43.274129, longitude: 5.420555), mapTitle: "Parc Borély"),
        
        Activity(title: "Board Game Night", image: Image("jeuxDeSociete"), city: "Marseille", date: Date(timeIntervalSinceNow: 86400 * 25), description: "Come and enjoy a fun evening with board games on October 20th at 7:00 PM in a cozy café. Discover new games and share great moments with friends and board game enthusiasts! 🎲🃏", subTitle: "Fun and Strategy Await!", eventImage: Image("jeuxDeSociete2"), location: CLLocationCoordinate2D(latitude: 43.295529, longitude: 5.368200), mapTitle: "Café des Jeux"),
        
        Activity(title: "Dance Class", image: Image("danse"), city: "Marseille", date: Date(timeIntervalSinceNow: 86400 * 30), description: "Join a Latin dance class on October 25th at 6:30 PM. Learn salsa and bachata moves in a festive atmosphere! No need to be an expert, just the desire to dance! 💃🎶", subTitle: "Dance to the Rhythm of the Music!", eventImage: Image("danse2"), location: CLLocationCoordinate2D(latitude: 43.295542, longitude: 5.374800), mapTitle: "Espace Danse Marseille"),
    ]
    @Environment(\.colorScheme) var colorScheme
    @State var isShowingCreateEventData = false
    @ObservedObject var userManager: UserManager
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        Text("READY TO GO OUT?")
                            .font(.headline)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        
//                        Button(action: {
//                            // Add action for selecting a plan
//                        }) {
//                            Text("HELP ME CHOOSE")
//                                .foregroundColor(Color.white)
//                                .padding()
//                                .background(Color(red: 0.3, green: 0.2, blue: 0.5))
//                                .cornerRadius(8)
//                        }
//                        .padding(.top, 10)
                        
                        
                        VStack(alignment: .center) {
                            Text("AVAILABLE ACTIVITIES")
                                .font(.subheadline)
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                .padding(.horizontal)
                            ForEach(activities) { activity in
                                NavigationLink {
                                    EventView(eventImage: activity.eventImage, title: activity.title, text: activity.description, subtitle: activity.subTitle, location: activity.location, mapTitle: activity.mapTitle)
                                } label: {
                                    ActivityCard(
                                        title: activity.title,
                                        date: activity.date,
                                        image: activity.image,
                                        location: activity.city
                                    )
                                }
                            }
                        }
                        .background(colorScheme == .dark ? Color.black : Color.white)
                    }
                    .background((colorScheme == .dark ? Color.black : Color.white).edgesIgnoringSafeArea(.all))
                }
            }
            .sheet(isPresented: $isShowingCreateEventData) {
                EventCreation(activities: $activities, isShowingCreateEventData: $isShowingCreateEventData)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if let selectedEmployee = userManager.users.first {
                        NavigationLink {
                            EmployeeDetailView(employee: selectedEmployee, isFromProfile: false)
                        } label: {
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.3, green: 0.2, blue: 0.5))
                                        .frame(width: 40, height: 40) // Size of the star
                                        .overlay(
                                            Circle()
                                                .stroke(Color.black, lineWidth: 2) // Border
                                        )
                                    loadImage(for: selectedEmployee)
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                }
                                Text(selectedEmployee.name)
                                    .fontWeight(.heavy)
                            }
                        }
                    } else {
                        Text("No Employee")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        isShowingCreateEventData = true
                    }
                    .fontWeight(.heavy)
                }
            }
        }
    }
}

#Preview {
    ActivitiesView(userManager: UserManager())
}
