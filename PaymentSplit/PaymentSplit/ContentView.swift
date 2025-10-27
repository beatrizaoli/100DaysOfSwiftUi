//
//  ContentView.swift
//  PaymentSplit
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("Check Amount:", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100) {Text ("\($0) people")}
                    }
                    .pickerStyle(.navigationLink)
                    //o navigationLink move o usuário para uma nova tela para selecionar sua opção, mas para funciona precisa exitir uma navigationStack
                }
            }
            .navigationTitle("We Split")
            //O title deve ser aplicado denro do navigationStack e em nivel superior para comunicar que o título é de toda tela, por isso fica ao final do Form e assim permite que o iOS altere os titulos livremente
        }
    }
}

#Preview {
    ContentView()
}
