//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//


import SwiftUI

struct ContentView: View {
    let lettersArray = Array("Hello Word") //tipo char
    
    @State private var amount = CGSize.zero
    @State private var enabled = false
    
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<lettersArray.count, id: \.self) {numero in
                Text(String(lettersArray[numero]))
                    .padding(10)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(amount)
                    .animation(.linear.delay(Double(numero) / 20), value: amount)
            }
        }
        .gesture(
            DragGesture()
            //
                .onChanged { amount = $0.translation }
                .onEnded { _ in // _ é sintaxe universal para ignorar argumento, in é o separador crucial que define o fim da declaração de parâmetros da closure e o início do seu corpo de código
                    amount = .zero
                    enabled.toggle()
                }
            )
    }

}

#Preview {
    ContentView()
}
