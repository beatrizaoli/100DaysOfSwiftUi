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
        .animation(.easeInOut(duration: 3).repeatCount(2, autoreverses: false), value: amount)
        //o easeInOut vai acontecer apenas por 2x e vai estabilizar para o estado padrão da view. Como o autorever ta false ele vai abrir dua vezes e parar no estado grande. Se estivesse true, ele iria abrir e diminuir e pular pra view padrão de forma abrupta.
    }
    
    func growUp() {
        amount += 1
    }
}

#Preview {
    ContentView()
}
