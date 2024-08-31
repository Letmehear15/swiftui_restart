//
//  HomeScreen.swift
//  restart
//
//  Created by Aleksandr Nesterov on 30.08.2024.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage(EAppStorageName.ShowingScreen.rawValue) var showingScreen: EScreens = .HomeScreen
    
    @State private var isAnimation = false
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            
            ZStack{
                BackgroundCircles(circlesColor: .colorGray)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimation ? -40 : 40)
                    .animation(.linear(duration: 2.5).repeatForever(), value: isAnimation)
                
            }
            
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
            
        }
        .padding()
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                isAnimation.toggle()
            })
        })
    }
}

#Preview {
    HomeScreen()
}
