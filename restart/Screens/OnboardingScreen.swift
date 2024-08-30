//
//  OnBoardingScreen.swift
//  restart
//
//  Created by Aleksandr Nesterov on 30.08.2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    @AppStorage(EAppStorageName.ShowingScreen.rawValue) var showingScreen: EScreens = .OnboardingScreen
    
    @State private var buttonOffset: CGFloat = 0
    @State private var slideWidth = UIScreen.main.bounds.size.width - 80
    @State private var slideScale: CGFloat = 1
    
    @State private var isPulsing = false
    
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
                        .scaleEffect(isPulsing ? 1.1 : 1)
                        .onAppear {
                            withAnimation(
                                .easeOut(duration: 1.5)
                                    .repeatForever(autoreverses: true)
                            ) {
                                isPulsing.toggle()
                            }
                        }
                    
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
                            .fill(.colorRed)
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack{
                            Circle()
                                .foregroundStyle(.black.opacity(0.2))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if value.translation.width > 0 && buttonOffset <= slideWidth - 90 {
                                        buttonOffset = value.translation.width
                                        slideScale += 0.001
                                    }
                                }
                            
                                .onEnded({ endValue in
                                    if buttonOffset <= slideWidth / 2 {
                                        buttonOffset = 0
                                        slideScale = 1
                                    } else {
                                        showingScreen = .HomeScreen
                                    }
                                })
                        )
                        Spacer()
                    }
                    
                    
                }
                .frame(width: slideWidth, height: 80)
                .padding()
            }
            
        }
    }
}

#Preview {
    OnBoardingScreen()
}
