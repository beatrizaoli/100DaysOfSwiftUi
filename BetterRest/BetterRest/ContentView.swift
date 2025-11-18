//
//  ContentView.swift
//  BetterRest
//
//  Created by Beatriz Amorim Oliveira on 14/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepamount =  8.0
    @State private var datinha = Date.now
    
    var body: some View {
        VStack{
            Stepper("Enter your sleep hours: \(sleepamount.formatted())", value:$sleepamount, in: 6...10, step: 0.5)
            DatePicker("Please enter a date", selection: $datinha)
        }
    }
}

#Preview {
    ContentView()
}
