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
        Form{
            Section {
                TextField("Check Amount:", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                //TextField gosta de text, mas usamos value no lugar de text pois text aceita string e value valor numerico. E quero usar o var cjeckAmount que é um Double
                //Passamos o format como currecy para que o valor seja tratado como dinheiro
                //Passamos Locale.current que contem pega as configurações da região do usuário, ele pega os dados do sistemas mas se o valor do usuário for nil ele usa USD
                //format é um formatador de texto, pode ser percentual, moeda...
                //Configuramos o tipo de teclado do textField para decimal
            }
        }
    }
}

#Preview {
    ContentView()
}
