//
//  ActivityCard.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 20.09.2024.
//

import SwiftUI

struct ActivityCard: View {
    var title: String
    var date: Date = .now
    var image: Image
    var location: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width - 40)
                .cornerRadius(20)
                .clipped()
            VStack(alignment: .center) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Spacer()
                HStack {
                    Text(date, style: .date)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(location)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 40, height: (UIScreen.main.bounds.width - 40) / 4)
            .background(.regularMaterial)
            .clipped()
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width - 40)
        .padding(.horizontal)
    }
}

#Preview {
    ActivityCard(title: "Card", image: Image("foot"), location: "Marseiile")
}
