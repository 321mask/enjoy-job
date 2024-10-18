//
//  SplashScreenView.swift
//  EnjoyJob
//
//  Created by apprenant81 on 25/09/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                MainView()
            } else {
                Image("enjoyJobLogo")
                    
                    .resizable()
                    .scaledToFill()
                    
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
        .background(Color(.black))
    }
}

#Preview {
    SplashScreenView()
}
