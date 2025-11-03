//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

//GRADIENTE Angular - COM ESPACO DELIMITADO POR PERCENTUAL
// AngularGradient(stops: [Gradient.Stop], center: UnitPoint)
// Gradiente radial se move para fora em formato circular, então, em vez de especificar uma direção, especificamos um raio inicial e um raio final. Começou em vermelho e terminou em verde, dividindo o espaço entre eles.

struct ContentView: View {
    var body: some View {
        AngularGradient(colors: [.red, .yellow, .purple, .green], center: .center)
       
    }
}

#Preview {
    ContentView()
}
