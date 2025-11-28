//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 1.0
    
    var body: some View {
        Button ("Tap"){
            growUp()
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(amount)
                .opacity(2 - amount)
                .animation(.easeOut(duration: 3).repeatForever(autoreverses: false), value: amount)
        )
        .scaleEffect(amount)
        .blur(radius: (amount - 1) * 2)
        .animation(.easeOut(duration: 3), value: amount)
    }
    
    func growUp() {
        amount += 1
    }
}

#Preview {
    ContentView()
}
