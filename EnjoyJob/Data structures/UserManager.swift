//
//  UserManager.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 25.09.2024.
//
import Foundation

class UserManager: ObservableObject {
    @Published var users: [Employee] = []
    
    private let userDefaultsKey = "users"
    
    init() {
        loadUsers()
    }
    
    func addUser(name: String, department: String, phoneNumber: String, jobTitle: String, bio: String, hobbies: String, image: String) {
        let newUser = Employee(name: name, department: department, phoneNumber: phoneNumber, jobTitle: jobTitle, bio: bio, hobbies: hobbies, image: image)
        users.append(newUser)
        saveUsers()
    }
    
    // Function to update an existing user
    func updateUser(at index: Int, name: String, department: String, phoneNumber: String, jobTitle: String, bio: String, hobbies: String, image: String) {
        guard index >= 0 && index < users.count else { return } // Check if the index is valid
        
        users[index].name = name
        users[index].department = department
        users[index].phoneNumber = phoneNumber
        users[index].jobTitle = jobTitle
        users[index].bio = bio
        users[index].hobbies = hobbies
        users[index].image = image
        
        saveUsers() // Save changes to UserDefaults
    }
    
    private func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadUsers() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey) {
            if let decoded = try? JSONDecoder().decode([Employee].self, from: data) {
                users = decoded
            }
        }
    }
    
    // Add a function to check if there is an existing profile
    var hasProfile: Bool {
        !users.isEmpty
    }
}
