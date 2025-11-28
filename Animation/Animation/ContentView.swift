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
        .scaleEffect(amount)
        .blur(radius: (amount - 1) * 2)
        .animation(.easeInOut(duration: 3), value: amount)
        //entrada e saída suave, duration é o tempo que a animação vai durar.
    }
    
    func growUp() {
        amount += 1
    }
}

#Preview {
    ContentView()
}
