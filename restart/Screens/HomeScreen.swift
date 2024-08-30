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
        Text("It is a home screen")
        
        Button(action: {
            showingScreen = .OnboardingScreen
        }, label: {
            Text("to unboarding")
        })
    }
}

#Preview {
    HomeScreen()
}
