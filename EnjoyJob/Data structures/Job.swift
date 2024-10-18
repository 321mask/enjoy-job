//
//  Job.swift
//  Divertissement
//
//  Created by apprenant81 on 21/09/2024.
//
import SwiftUI

struct Job: Identifiable {
    let id = UUID()
    let name: String
    let employees: [String]
}
