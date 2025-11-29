//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//
//Se aplicarmos vários modificadores animation(), cada um controla tudo o que vem antes dele até a próxima animação. Isso nos permite animar mudanças de estado de diversas maneiras diferentes, em vez de uniformemente para todas as propriedades
//Você pode ter quantos animation()modificadores forem necessários para construir seu projeto, o que nos permite dividir uma mudança de estado em quantos segmentos precisarmos.

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundStyle(.white)
            .animation(.default, value: enabled) //anima a troca de cor
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 3, bounce: 0.6), value: enabled) //anima a troca de forma e não interfere na troca de cor
        
    }
}

#Preview {
    ContentView()
}
