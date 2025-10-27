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
    @FocusState private var amountIsFocused: Bool
    
    private let tipPercentages = [5, 10, 15, 20]

    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = tipSelection * checkAmount / 100
        let totAmount = (checkAmount + tipValue)
        return totAmount
    }

    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople+2)
        let amountPerPerson = totalAmount / peopleCount
        return amountPerPerson
    }
    

    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("Check Amount:", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100) {Text ("\($0) people")}
                    }
                }
                Section ("How much do you want to tip?") {
                    Picker ("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101) {Text ($0, format: .percent)}
                        //trocamos os percentuais do picker indo de 0 a 100
                    }
                    .pickerStyle(.navigationLink)
                    //os percentuais de 0 a 100 abrem em uma lista de navegação separada
                }
                Section("Total Amount"){
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section ("Payment per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("We Split")
            .toolbar{
                if amountIsFocused { 
                    Button("Done"){ amountIsFocused = false}
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
