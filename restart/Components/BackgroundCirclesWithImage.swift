//
//  BackgroundCircles.swift
//  restart
//
//  Created by Aleksandr Nesterov on 30.08.2024.
//

import SwiftUI

struct BackgroundCircles: View {
    
    @State var imageName: String
    @State var circlesColor: Color = .white
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(circlesColor, lineWidth: 85)
                .opacity(0.3)
                .frame(width: 280)
            
            Circle()
                .stroke(circlesColor, lineWidth: 45)
                .opacity(0.3)
                .frame(width: 280)
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
            
        }
        .padding()
    }
}

#Preview {
    ZStack{
        Color(.colorBlue).ignoresSafeArea()
        
        BackgroundCircles(imageName: "character-1", circlesColor: .indigo)
    }
}
