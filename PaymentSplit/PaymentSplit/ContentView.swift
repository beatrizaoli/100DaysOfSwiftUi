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
    
    private let tipPercentages = [5, 10, 15, 20]

    var totalPerPerson:Double { //var computada
        let peopleCount = Double(numberOfPeople+2) //somamos 2 pois a lista tem um intervalo de 2 a 100, mas conta a partir de 0. Ou seja se selecionamos o valor 2 na lista ele me retorna 0 em valor.
        let tipSelection = Double(tipPercentage)
        let tipValue = tipSelection * checkAmount / 100
        let amountPerPerson = (checkAmount + tipValue) / peopleCount
        return amountPerPerson
    }
    

    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("Check Amount:", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100) {Text ("\($0) people")}
                    }
                }
                Section ("How much do you want to tip?") {
                    Picker ("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self) {Text ($0, format: .percent)}
                    }
                    .pickerStyle(.segmented)
                }
                //adiciona Section de pagamento por pessoa
                Section ("Payment per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("We Split")
        }
    }
}

#Preview {
    ContentView()
}
