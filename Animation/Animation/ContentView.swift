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
        Button("Tap Me") {
            withAnimation (.spring(duration: 3, bounce: 0.7)) {
                amount += 180
            }
        }
        .padding(60)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(amount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ContentView()
}
