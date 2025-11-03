//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

//Botão personalizavel com image e label
//Usar label faz com que SwiftUI decida automaticamente se exibe o ícone, o texto ou ambos, dependendo de como estão sendo usados ​​no layout

struct ContentView: View {

    var body: some View {
        Button{
            print("Tapped")
        } label : {
            Label("Edit", systemImage: "pencil")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
}

#Preview {
    ContentView()
}
