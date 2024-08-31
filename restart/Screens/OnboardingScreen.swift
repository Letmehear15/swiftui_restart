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
    
    @State private var isAnimating = false
    
    @State private var isPulsing = false
    
    @State private var imageOffset: CGSize = .zero
    
    @State private var titleText = "Shared."
    
    var body: some View {
        ZStack{
            Color(.colorBlue).ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 10){
                VStack{
                    Text(titleText)
                        .fontWeight(.heavy)
                        .font(.system(size: 60))
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .transition(.opacity)
                        .id(titleText)
                    
                    Text("""
                         It's not how much we give
                         but how much love we put into your giving.
                        """)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                Spacer()
                
                ZStack{
                    BackgroundCircles()
                        .blur(radius: abs(imageOffset.width / 10))
                        .offset(x: -imageOffset.width)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.3), value: isAnimating)
                        .offset(x: imageOffset.width)
                        .rotationEffect(.degrees(imageOffset.width / 20))
                        .gesture (
                            DragGesture()
                                .onChanged({value in
                                    withAnimation(.easeOut(duration: 0.5)){
                                        if abs(imageOffset.width) <= 150 {
                                            imageOffset = value.translation
                                            titleText = "Give."
                                        }
                                    }
                                })
                            
                                .onEnded{_ in
                                    withAnimation(.easeOut(duration: 0.5)){
                                        imageOffset = .zero
                                        titleText = "Shared."
                                    }
                                    
                                }
                            
                        )
                        .overlay(alignment: .bottom, content: {
                            Image(systemName: "arrow.left.and.right.circle")
                                .foregroundColor(.white)
                                .font(.title)
                                .opacity(abs(imageOffset.width) > 10 ? 0 : 0.6)
                                .animation(.easeOut.delay(0.3), value: imageOffset.width)
                            }
                        )
                }
                
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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
            
        }
        .onAppear(perform: {
            isAnimating.toggle()
        })
        
    }
}

#Preview {
    OnBoardingScreen()
}
