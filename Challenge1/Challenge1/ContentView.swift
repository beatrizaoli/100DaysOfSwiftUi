//
//  ContentView.swift
//  Challenge1
//
//  Created by Beatriz Amorim Oliveira on 28/10/25.
//

import SwiftUI
import Foundation
//usar format: .number
//Conversão de volume: os usuários escolhem mililitros, litros, xícaras, pintas ou galões.
//converter a entrada do usuário em mililitros (o menor denominador comum) e, então, converter daí para qualquer unidade de saída que ele desejar
//input number, their input unit, and their output unit – you need to have three @State properties to store them all. You’ll need a TextField, two pickers, and a text view to show your output
//ml = 1000, dm = 100, L=10000

struct ContentView: View {
    @State private var userVolume = 0.0
    @State private var initialUnit = "mL"
    @State private var choosenUnit = "L"
    private let units = ["mL", "dL", "L", "cups"]
    
//    var result: Measurement<UnitVolume>{
//        let mililitersPattern = Measurement(value: userVolume, unit: UnitVolume.milliliters)
//    }
//    
//    var totalAmount: Double {
//        let tipSelection = Double(tipPercentage)
//        let tipValue = tipSelection * checkAmount / 100
//        let totAmount = (checkAmount + tipValue)
//        return totAmount
//    }
//    let volumeMeasurement = Measurement(value: userVolume, unit: UnitVolume.milliliters)
    
    var body: some View {
        NavigationStack{
            Form {
                Section ("Initial Unit") {
                    Picker ("Unit", selection: $initialUnit){
                        ForEach(units, id:\.self) {Text ($0)}
                    }
                }
                Section ("Volume"){
                    TextField("Volume:", value: $userVolume, format: .number)
                }
                Section ("Choose a unit"){
                    Picker ("Units", selection: $choosenUnit){
                        ForEach(units, id:\.self) {Text ($0)}
                    }
                    .pickerStyle(.segmented)
                }
                Section ("Result"){
                    //                    VAR COMPUTADA COM O RESULTADO
                    //                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //                }
                }
                .navigationTitle("Volume conversion")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
