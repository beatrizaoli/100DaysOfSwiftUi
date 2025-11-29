//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//
// Um cartão que podemos arrastar pela tela, mas que, ao soltarmos, retorna à sua posição original.
// offset(), que nos permite ajustar as coordenadas X e Y de uma visualização sem mover outras visualizações ao redor.

import SwiftUI

struct ContentView: View {
    
    @State private var amount = CGSize.zero //Define o estado inicial do deslocamento como 0 em X e 0 em Y (posição inicial).
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(amount)
            .gesture(
                DragGesture()
                    .onChanged { amount = $0.translation }
                    .onEnded { _ in withAnimation(.bouncy)
                        {amount = .zero }
                    }
            )
    }
}

#Preview {
    ContentView()
}
