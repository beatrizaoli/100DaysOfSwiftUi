//
//  ContentView.swift
//  Challenge1
//
//  Created by Beatriz Amorim Oliveira on 28/10/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var userVolume = 0.0
    @State private var initialUnit = "milliliters"
    @State private var choosenUnit = "liters"
    private let units = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    func stringToUnit (_ unitValue: String) -> UnitVolume {
        switch unitValue {
            case "milliliters": return .milliliters
            case "liters": return .liters
            case "cups": return .cups
            case "pint": return .pints
            case "gallons": return .gallons
            default : return . milliliters
        }
    }
    
    var convertedResult: Double {
        let initialUnitX = stringToUnit(initialUnit)
        let choosenUnitX = stringToUnit(choosenUnit)
        
        let measurementLocker = Measurement(value: userVolume, unit: initialUnitX)
        let conversionResult = measurementLocker.converted(to: choosenUnitX)
        return conversionResult.value
    }

    
    var body: some View {
        NavigationStack{
            Form {
                Section ("Initial Unit") {
                    Picker ("Unit", selection: $initialUnit){
                        ForEach(units, id:\.self) {Text ($0)}
                    }
                }
                Section ("Initial Volume"){
                    TextField("Volume:", value: $userVolume, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section ("Choose a unit"){
                    Picker ("Units", selection: $choosenUnit){
                        ForEach(units, id:\.self) {Text ($0)}
                    }
                    .pickerStyle(.segmented)
                }
                Section ("Result"){
                    Text(convertedResult, format: .number)
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
