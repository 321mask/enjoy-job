
// ProfileDetailView.swift
// Divertissement
//
// Créé par apprenant81 le 21/09/2024.
//

import SwiftUI

struct ProfileDetailView: View {
    @StateObject private var userManager = UserManager()
    var body: some View {
        NavigationStack {
            List {
                ForEach(services) { service in
                    Section(header: Label(service.sectorActivity, systemImage: service.symbol)) {
                        ForEach(service.jobs) { job in
                            DisclosureGroup(job.name) {
                                ForEach(job.employees, id: \.self) { employeeName in
                                    if let employee = employees.first(where: { $0.name == employeeName }) {
                                        NavigationLink {
                                            EmployeeDetailView(employee: employee, isFromProfile: true)
                                        } label: {
                                            Text(employee.name)
                                        }
                                        
                                    } else {
                                        Text(employeeName)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Team Collection")
    }
}

#Preview {
    ProfileDetailView()
}
