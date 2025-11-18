//
//  ContentView.swift
//  BetterRest
//
//  Created by Beatriz Amorim Oliveira on 14/11/25.
//

import SwiftUI

//cria uma tela com o valor (sleepamount) e botoes de + e - que alteram o valor

struct ContentView: View {
    @State private var sleepamount =  8.0
    
    var body: some View {
        Stepper("\(sleepamount)", value:$sleepamount)
    }
}

#Preview {
    ContentView()
}
