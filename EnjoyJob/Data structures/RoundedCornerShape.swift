//
//  RoundedCornerShape.swift
//  EnjoyJob
//
//  Created by Арсений Простаков on 20.09.2024.
//

import Foundation
import SwiftUI

struct RoundedCornersShape: Shape {
    var topLeft: CGFloat = 0
    var topRight: CGFloat = 0
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()

        // Start at the top-left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + topLeft))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + topRight))

        // Top-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRight))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - bottomRight, y: rect.maxY),
            controlPoint: CGPoint(x: rect.maxX, y: rect.maxY)
        )

        // Bottom-right corner
        path.addLine(to: CGPoint(x: rect.minX + bottomLeft, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - bottomLeft),
            controlPoint: CGPoint(x: rect.minX, y: rect.maxY)
        )

        // Bottom-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeft))

        path.close()
        return Path(path.cgPath)
    }
}
