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
        .scaleEffect(amount) //aumennta o tamanho
       
        .blur(radius: (amount - 1) * 2) //desfoca conforme o radius diminui
        .animation(.default, value: amount) //Quando amount muda aplica .default a qualquer modificador que dependa de amount. Muda a forma que ocorre o aumento e o desfoque, ocorre de forma mais suave para que o usuário perceba mudando e não mostre apenas o estado antigo e pulo para o novo, mostra a transição. Aplica default ao value, quando tiver o value mudar aplica default.
    }
    
    func growUp() {
        amount += 1
    }
}

#Preview {
    ContentView()
}
