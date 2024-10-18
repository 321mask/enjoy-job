//
//  EventCreation.swift
//  Divertissement
//
//  Created by apprenant81 on 24/09/2024.
//
import SwiftUI
import PhotosUI
import MapKit

struct EventCreation: View {
    @Binding var activities: [Activity]
    @Binding var isShowingCreateEventData: Bool
    @State var title: String = ""
    @State var description: String = ""
    @State var date = Date()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var secondSelectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var selectedEventImage: Data? = nil
    @State var mapTitle: String = ""
    @State var subtitle: String = ""
    @State var city: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.269823, longitude: 5.395907)
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Event date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                TextField("Subtitle", text: $subtitle)
                TextField("City", text: $city)
                TextField("Map title", text: $mapTitle)
                // Latitude input
                HStack {
                    TextField("Enter Latitude", text: $latitude)
                        .keyboardType(.decimalPad) // For decimal input
                        .onChange(of: latitude) { oldValue, newValue in
                            updateCoordinate()
                        }
                    Divider()
                    // Longitude input
                    TextField("Enter Longitude", text: $longitude)
                        .keyboardType(.decimalPad)
                        .onChange(of: longitude) { oldValue, newValue in
                            updateCoordinate()
                        }
                }
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Text("Select a picture")
                    }
                    .onChange(of: selectedItem) { oldValue, newItem in
                        if let newItem {
                            Task {
                                if let data = try await newItem.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                    }
                PhotosPicker(
                    selection: $secondSelectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Text("Select a 2nd picture")
                    }
                    .onChange(of: secondSelectedItem) { oldValue, newItem in
                        if let newItem {
                            Task {
                                if let data = try await newItem.loadTransferable(type: Data.self) {
                                    selectedEventImage = data
                                }
                            }
                        }
                    }
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                }
                if let selectedEventImage,
                   let uiImage = UIImage(data: selectedEventImage) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                }
            }
            .navigationTitle("Event Creation")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        isShowingCreateEventData = false
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        if !title.isEmpty && !description.isEmpty {
                            
                            let newEvent = Activity(title: title, image: Image(uiImage: UIImage(data: selectedImageData!)!), city: city, date: date, description: description, subTitle: subtitle, eventImage: Image(uiImage: UIImage(data: selectedEventImage!)!), location: location, mapTitle: mapTitle)
                            activities.append(newEvent)
                        }
                        isShowingCreateEventData = false
                    }
                }
            }
        }
        .accentColor(Color(red: 0.3, green: 0.2, blue: 0.5))
    }
    private func updateCoordinate() {
        if let lat = Double(latitude), let long = Double(longitude) {
            location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        } else {
            print("Invalid input")
        }
    }
}

#Preview {
    EventCreation(activities: .constant([]), isShowingCreateEventData: .constant(false), description: "", mapTitle: "", subtitle: "", city: "", location: CLLocationCoordinate2D(latitude: 43.269823, longitude: 5.395907))
}

