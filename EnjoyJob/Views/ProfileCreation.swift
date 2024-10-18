//
//  ProfileCreation.swift
//  Divertissement
//
//  Created by Apprenant 104 on 23/09/2024.
//
import SwiftUI
import PhotosUI

struct ProfileCreation: View {
    @ObservedObject var userManager: UserManager
    @State var name: String = ""
    @State var department: String = ""
    @State var jobTitle: String = ""
    @State var bio: String = ""
    @State var hobbies: String = ""
    @State var image: String = ""
    @State var birthDate: Date = Date()
    @State var phoneNumber: String = ""
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImageData: Data? = nil
    var employeeIndex: Int?
    
    @State private var selectedService: String = ""
    var services = [
        "Engineering and Maintenance",
        "Sales and Marketing",
        "Finance and Accounting",
        "Human Resources",
        "Legal and Compliance",
        "Procurement and Supply Chain",
        "IT and Communications",
        "Customer Experience",
        "Sustainability and Environmental Management"
    ]
    @State private var isPickerPresented: Bool = false
    func handleImageSelection(_ image: UIImage) {
        if let savedFileName = saveImageToDocumentsDirectory(image) {
            print("Saved image filename: \(savedFileName)") // Debug
            // Update or add the user with the saved image file name
            if let index = employeeIndex, index >= 0 && index < userManager.users.count {
                userManager.updateUser(at: index, name: name, department: department, phoneNumber: phoneNumber, jobTitle: jobTitle, bio: bio, hobbies: hobbies, image: savedFileName)
            } else {
                userManager.addUser(name: name, department: department, phoneNumber: phoneNumber, jobTitle: jobTitle, bio: bio, hobbies: hobbies, image: savedFileName)
            }
        } else {
            print("Failed to save image") // Debug
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        if let selectedImageData,
                           let uiImage = UIImage(data: selectedImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                                .shadow(radius: 10)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.5))
                        }
                        Image(systemName: "camera.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.black.opacity(0.7)))
                            .offset(x: -10, y: -10)
                            .onTapGesture {
                                isPickerPresented = true
                            }
                    }
                    .photosPicker(isPresented: $isPickerPresented, selection: $selectedItem, matching: .images)
                    .onChange(of: selectedItem) { oldvalue, newItem in
                        if let newItem {
                            Task {
                                if let data = try? await newItem.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    selectedImageData = data
                                    handleImageSelection(uiImage) // Save image when selected
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Personal Information")) {
                        TextField("Name", text: $name)
                        Divider()
                        TextField("Department", text: $department)
                        Divider()
                        TextField("Job title", text: $jobTitle)
                        Divider()
                        TextField("Bio", text: $bio)
                        Divider()
                        TextField("Hobbies", text: $hobbies)
                        Divider()
                        DatePicker("Birthday", selection: $birthDate, displayedComponents: .date)
                        Divider()
                        TextField("Phone Number", text: $phoneNumber)
                    }
                    Section(header: Text("Service")) {
                        Picker("Select service", selection: $selectedService) {
                            ForEach(services, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                }
                .padding()
            }
            Button(action: {
                if let index = employeeIndex, index >= 0 && index < userManager.users.count {
                    // Update an existing user
                    userManager.updateUser(at: index, name: name, department: department, phoneNumber: phoneNumber, jobTitle: jobTitle, bio: bio, hobbies: hobbies, image: image)
                } else {
                    // Create a new user
                    userManager.addUser(name: name, department: department, phoneNumber: phoneNumber, jobTitle: jobTitle, bio: bio, hobbies: hobbies, image: image)
                }
            }) {
                Text(employeeIndex != nil ? "Update Profile" : "Create Profile")
            }
            .onAppear {
                if let index = employeeIndex, index >= 0 && index < userManager.users.count {
                    let employee = userManager.users[index]
                    name = employee.name
                    department = employee.department
                    phoneNumber = employee.phoneNumber
                    jobTitle = employee.jobTitle
                    bio = employee.bio
                    hobbies = employee.hobbies
                    image = employee.image
                }
            }
            .frame(maxWidth: 350)
            .padding()
            .background(Color(red: 0.3, green: 0.2, blue: 0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
#Preview {
    ProfileCreation(userManager: UserManager(), employeeIndex: 0)
}
