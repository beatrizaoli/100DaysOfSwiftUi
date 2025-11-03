//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

//style e role de botões, destructive torna ele vermelho
//Apple recomenda explicitamente não usar muitos botões em destaque (buttonStyle(.borderedProminent)), porque quando tudo é em destaque, nada é.

struct ContentView: View {

    var body: some View {
        //Botão cinza e letra azul
        Button ("Button1"){}
            .buttonStyle(.bordered)
        //Botão cinza e letra vermelha
        Button ("Button2", role: .destructive){}
            .buttonStyle(.bordered)
        //Botão vermelho com letras brancas
        Button("Button3", role: .destructive){}
            .buttonStyle(.borderedProminent)
        //Botão azul com letras brancas
        Button("Button4"){}
            .buttonStyle(.borderedProminent)
        //Botão verde com letras brancas
        Button("Button5"){}
            .buttonStyle(.borderedProminent)
            .tint(.mint)
    }
}

#Preview {
    ContentView()
}
