//
//  OnBoardingScreen.swift
//  restart
//
//  Created by Aleksandr Nesterov on 30.08.2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    @AppStorage(EAppStorageName.ShowingScreen.rawValue) var showingScreen: EScreens = .OnboardingScreen
    
    var body: some View {
        ZStack{
            Color(.colorBlue).ignoresSafeArea(.all, edges: .all)
            
            VStack{
                VStack{
                    Text("Share.")
                        .fontWeight(.heavy)
                        .font(.system(size: 60))
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    Text("""
                         It's not how much we give
                         but how much love we put into your giving.
                        """)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                }
                
                Spacer()

                BackgroundCircles(
                    imageName: "character-1"
                )
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .foregroundStyle(.white.opacity(0.3))
                    
                    Capsule()
                        .foregroundStyle(.white.opacity(0.3))
                        .padding(8)
                    
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    HStack{
                        Capsule()
                            .foregroundStyle(.colorRed)
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    
                    
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(.colorRed)
                            Circle()
                                .foregroundStyle(.black.opacity(0.2))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                        }
                        .onTapGesture {
                            showingScreen = .HomeScreen
                        }
                        
                        Spacer()
                    }

                }
                .frame(height: 80)
                .padding()
                
            }
            
        }
    }
}

#Preview {
    OnBoardingScreen()
}
