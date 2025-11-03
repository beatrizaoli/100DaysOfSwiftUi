//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

//GRADIENTE STOPS - COM ESPACO DELIMITADO POR PERCENTUAL
//LinearGradient(stops: [Gradiente.Stop], startPoint: UnitPoint, endPoint: UnitPoint)

struct ContentView: View {
    var body: some View {
              LinearGradient(stops:
                [.init(color: .white, location: 0.4), //aqui colocamos a cor e o espa;o que irá ocupar
                .init(color: .black, location: 0.6)],
                startPoint: .top, endPoint: .bottom
              )
    }
}

#Preview {
    ContentView()
}
