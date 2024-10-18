// EmployeeDetailView.swift
// Divertissement
//
// Créé par apprenant81 le 21/09/2024.
//

import SwiftUI

struct EmployeeDetailView: View {
    let employee: Employee
    let isFromProfile: Bool
    var body: some View {
        VStack(alignment: .center) {
            if isFromProfile {
                // Load image from assets if coming from Profile
                Image(employee.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 300)
            } else {
                // Load image from file manager if coming from ActivitiesView
                loadImage(for: employee)
                    .scaledToFit()
                    .frame(width: 500, height: 300)
            }
            
            Text(employee.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(employee.department)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(employee.jobTitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
            VStack(alignment: .center, spacing: 10) {
                Text("About me")
                    .font(.headline)
                
                Text(employee.bio)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                Text("Hobbies")
                    .font(.headline)
                Text(employee.hobbies)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EmployeeDetailView(employee: employees[1], isFromProfile: true)
}
