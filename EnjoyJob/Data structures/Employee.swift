//
//  Employee.swift
//  Divertissement
//
//  Created by apprenant81 on 21/09/2024.
//
import SwiftUI

struct Employee: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var department: String
    var phoneNumber: String
    var jobTitle: String
    var bio: String
    var hobbies: String
    var image: String
    var birthDate: Date?
}
func loadImage(for employee: Employee) -> some View {
    if employee.image.isEmpty {
        print("No image filename found for employee.")
        return AnyView(Image(systemName: "person.crop.circle") // Placeholder for missing image
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40) // Adjust the frame size as necessary
            .clipShape(Circle()))
    }
    
    let imageFileName = employee.image
    let imagePath = getDocumentsDirectory().appendingPathComponent(imageFileName)
    print("Attempting to load image from: \(imagePath.path)") // Debugging statement
    
    if FileManager.default.fileExists(atPath: imagePath.path) {
        if let uiImage = UIImage(contentsOfFile: imagePath.path) {
            return AnyView(Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                 // Adjust the frame size as necessary
                )
        } else {
            print("Failed to load image from path: \(imagePath.path)")
        }
    } else {
        print("Image file does not exist at path: \(imagePath.path)")
    }
    
    // Return a placeholder image if loading fails
    return AnyView(Image(systemName: "person.crop.circle") // Placeholder for missing image
        .resizable()
        .scaledToFill()
        .frame(width: 40, height: 40) // Adjust the frame size as necessary
        .clipShape(Circle()))
}
func saveImageToDocumentsDirectory(_ image: UIImage) -> String? {
    
    if let data = image.jpegData(compressionQuality: 0.8) {
        let filename = UUID().uuidString + ".jpg" // Ensure a unique filename
        let fileURL = getDocumentsDirectory().appendingPathComponent(filename)
        do {
            try data.write(to: fileURL) // Save the image data
            return filename // Return the filename for later retrieval
        } catch {
            print("Error saving image: \(error)")
        }
    }
    return nil
}

func getDocumentsDirectory() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}
