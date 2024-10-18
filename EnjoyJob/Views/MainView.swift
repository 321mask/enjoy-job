//
//  MainView.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 20.09.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var userManager = UserManager()
    var body: some View {
        TabView {
            ActivitiesView(userManager: userManager)
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            ProfileDetailView()
                .tabItem {
                    Image(systemName: "person.3.sequence")
                    Text("Services")
                }
            ProfileCreation(userManager: userManager, employeeIndex: userManager.users.isEmpty ? nil : 0)
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Create Profile")
                }
        }
        .accentColor(Color(red: 0.3, green: 0.2, blue: 0.5))
    }
}

#Preview {
    MainView()
}
