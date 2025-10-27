//
//  ContentView.swift
//  PaymentSplit
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{ //adiciona a nagivation bar mas sem nome
            Form {
                    Section{
                        Text ("Form Text")
                        Text ("Form Text")
                        Text ("Form Text")
                    }
                    Section{
                        Text ("Form Text")
                        Text ("Form Text")
                        Text ("Form Text")
                    }
                }
            .navigationTitle("Titulo") //adiciona o texto do titulo da nagivation bar
            .navigationBarTitleDisplayMode(.inline) //titulo menor centralizado
        }
    }
}

#Preview {
    ContentView()
}
