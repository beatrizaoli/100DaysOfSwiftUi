//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI
//.gradient - gradiente automatico usado apenas em background e foreground

struct ContentView: View {
    var body: some View {
        Text("Textinho Maroto")
            .frame(maxWidth: .infinity, maxHeight: .infinity) //coloca a cor na tela toda
            .foregroundStyle(.white)
            .background(.red.gradient) //só com o background a cor fica só envolta do nome
    }
}

#Preview {
    ContentView()
}
