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
        .animation(.easeInOut(duration: 3).repeatForever(), value: amount)
        //o repeatForever vai fazer a entrada e saída suave do easeInOut ocorrer eternamente. Ao clicar ele fica indo e voltando e se clicar de novo aumento e continua no movimento
    }
    
    func growUp() {
        amount += 1
    }
}

#Preview {
    ContentView()
}
