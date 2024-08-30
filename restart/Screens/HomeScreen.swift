//
//  HomeScreen.swift
//  restart
//
//  Created by Aleksandr Nesterov on 30.08.2024.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage(EAppStorageName.ShowingScreen.rawValue) var showingScreen: EScreens = .HomeScreen
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            
            BackgroundCircles(imageName: "character-2", circlesColor: .colorGray)
            
            Text("""
                    The time that leads to mastery
                is dependeton the intensity of our
                focus.
                """)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
            .font(.title3)
            .foregroundColor(.secondary)
            .padding(.top, 20)
            
            Spacer()
            
            Button(action: {
                showingScreen = .OnboardingScreen
            }) {
               Label("Restart", systemImage: "arrow.2.circlepath.circle.fill")
                    .font(.system(size: 20, weight: .bold))
                    .imageScale(.large)
            
            }
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            
        }.padding()
    }
}

#Preview {
    HomeScreen()
}
