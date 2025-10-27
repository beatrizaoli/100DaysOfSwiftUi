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
                Section ("How dmuch do you want to tip?") {
                    Picker ("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self) {Text ($0, format: .percent)}
                    }
                    //Fizemos um picker pra gorjeta no qual a lista de opcoes percorre sobre o array.
                    .pickerStyle(.segmented)
                    //coloca a lista do picker em bloquinhos
                }
            }
            .navigationTitle("We Split")
        }
    }
}

#Preview {
    ContentView()
}
