//
//  Activity.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 23.09.2024.
//

import Foundation
import SwiftUI
import MapKit

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let image: Image
    let city: String
    let date: Date
    let description: String
    let subTitle: String
    let eventImage: Image
    let location: CLLocationCoordinate2D
    let mapTitle: String
    
}


