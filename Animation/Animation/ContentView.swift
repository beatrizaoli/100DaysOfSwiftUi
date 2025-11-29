//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//
//Rotation3DEffect precisa do withAnimation para a animação ocorrer porque ele é apenas um modificador de view, ele muda estado mas não aplica animação em si.
//O modificador rotation3DEffect por si só não sabe que tipo de animação (duração, curva) você deseja, e ele não tem a capacidade de animar as mudanças de estado, apenas de aplicá-las.

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 1.0
    
    var body: some View {
        VStack{
            Button("Tap Me") {}
                .background(.blue)
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            Button("Tap Me") {}
                .frame(width: 200, height: 200)
                .background(.blue)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
