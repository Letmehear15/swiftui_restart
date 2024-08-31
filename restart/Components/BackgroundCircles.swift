//
//  BackgroundCircles.swift
//  restart
//
//  Created by Aleksandr Nesterov on 30.08.2024.
//

import SwiftUI

struct BackgroundCircles: View {
    
    @State var circlesColor: Color = .white
    
    @State private var isAnimating = false
    
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
        }
        .opacity(isAnimating ? 1 : 0)
        .blur(radius: isAnimating ? 0 : 10)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating.toggle()
        })
    
    }
}

#Preview {
    ZStack{
        Color(.colorBlue).ignoresSafeArea()
        
        BackgroundCircles(circlesColor: .colorGray)
    }
}
