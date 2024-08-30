//
//  ContentView.swift
//  restart
//
//  Created by Aleksandr Nesterov on 29.08.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(EAppStorageName.ShowingScreen.rawValue) var showingScreen: EScreens = .HomeScreen
    
    var body: some View {
        switch showingScreen {
        case .HomeScreen:
            HomeScreen()
        case .OnboardingScreen:
            OnBoardingScreen()
        }
    }
}
    
    #Preview {
        ContentView()
    }
