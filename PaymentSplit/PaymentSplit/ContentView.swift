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
    @FocusState private var amountIsFocused: Bool //adicionamos property wrapper FocusState
    
    private let tipPercentages = [5, 10, 15, 20]

    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople+2)
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
                        .focused($amountIsFocused) //adicionamos o funcionamento da FocusState que irá armazenar o estado de true ou false quando essa section tem interação com o usuário, ele força o foco durante a interação com o usuário
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
                Section ("Payment per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("We Split")
            .toolbar{ //adiciona coisas a barra de ferramenas
                if amountIsFocused { //se o amountIsFocused for true cria o botao de "done" que faz o amountIsFocusedSer false
                    Button("Done"){ amountIsFocused = false}
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
