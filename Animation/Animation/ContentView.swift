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
        Button ("Tap"){}
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(amount)
                .opacity(2 - amount)
                .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: amount)
        )
        .onAppear{
            amount = 2
        }
    }
}

#Preview {
    ContentView()
}
