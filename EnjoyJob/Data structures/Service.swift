// Service.swift
// Divertissement
//
// Créé par apprenant81 le 21/09/2024.
//

import SwiftUI

struct Service: Identifiable {
    let id = UUID()
    let sectorActivity: String
    let symbol: String
    let jobs: [Job]
}

let services: [Service] = [
    Service(sectorActivity: "Engineering and Maintenance", symbol: "wrench.and.screwdriver.fill", jobs: [
        Job(name: "Mechanical Engineer", employees: ["Fabio Santos"]),
        Job(name: "Maintenance Technician", employees: ["Alice Félix", "Bob Mascarenhas"])]),
    
    Service(sectorActivity: "Sales and Marketing", symbol: "cart.fill", jobs: [
        Job(name: "Marketing Specialist", employees: ["Eve Chenaf", "Frank Ahamadou"]),
        Job(name: "Sales Manager", employees: ["Grace Bonafede", "Heidi Dufrien"])]),
    
    Service(sectorActivity: "Finance and Accounting", symbol: "dollarsign.circle.fill", jobs: [
        Job(name: "Accountant", employees: ["Ivan Araujo", "Judy Malotov"]),
        Job(name: "Financial Analyst", employees: ["Karl Laplace", "Liam Bourdieu"])]),
    
    Service(sectorActivity: "Human Resources", symbol: "person.3.fill", jobs: [
        Job(name: "Recruitment and Staffing", employees: ["Valerie Aubart", "Joseph Aboudou"]),
        Job(name: "Training and Development", employees: ["Diana Besson", "Arseny Gibert"]),
        Job(name: "Crew Management", employees: ["Lucélia Cisse", "Alexandre Bompard"])]),
    
    Service(sectorActivity: "Legal and Compliance", symbol: "scroll.fill", jobs: [
        Job(name: "Contracts and Negotiations", employees: ["Jérôme Grasland", "Barbara Tideman"]),
        Job(name: "Regulatory Compliance", employees: ["Catherine Sartorio", "Anelise Tabouret"]),
        Job(name: "Insurance and Claims", employees: ["Julie Steban", "Robert Smith"])]),
    
    Service(sectorActivity: "Procurement and Supply Chain", symbol: "shippingbox.fill", jobs: [
        Job(name: "Supplier Management", employees: ["Antoine Poyet", "Noemie Ferreira"]),
        Job(name: "Inventory Management", employees: ["Doriane Morgan", "Simone Humbert"])]),
    
    Service(sectorActivity: "IT and Communications", symbol: "antenna.radiowaves.left.and.right", jobs: [
        Job(name: "Fleet Communication Systems", employees: ["Lucie Bernard", "Claire Bat"]),
        Job(name: "Navigation Systems", employees: ["Laurie Germand", "Marie Linux"]),
        Job(name: "Data and Network Security", employees: ["Chloé Android", "Mark Joel"])]),
    
    Service(sectorActivity: "Customer Experience", symbol: "person.fill.checkmark", jobs: [
        Job(name: "On-board Services", employees: ["Yannick Belford", "Cintia da Silva"]),
        Job(name: "Event Planning", employees: ["Thais Costa", "Ricardo Santana"])]),
    
    Service(sectorActivity: "Sustainability and Environmental Management", symbol: "leaf.fill", jobs: [
        Job(name: "Environmental Compliance", employees: ["Carlos Beduschi", "Marcio Gurgel"]),
        Job(name: "Waste Management", employees: ["Juliana Gouveia", "Vanessa Camargo"])])
]
