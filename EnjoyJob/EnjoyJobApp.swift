//
//  EnjoyJobApp.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 20.09.2024.
//

import SwiftUI

@main
struct EnjoyJobApp: App {
    @Environment(\.colorScheme) var colorScheme
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
