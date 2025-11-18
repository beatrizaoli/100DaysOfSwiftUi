//
//  ContentView.swift
//  BetterRest
//
//  Created by Beatriz Amorim Oliveira on 14/11/25.
//

import SwiftUI

//labelsHidden tira o titulo da tela, aparece só a data e hora centralizadas
//displayComponents troca a formatacao pra apartece só data, só hora..
//adiciona in no DatePicker faz com que tenha um limite, no caso de in: Date.now... impede que escolha datas anteriores a hoje


struct ContentView: View {
    @State private var sleepamount =  8.0
    @State private var datinha = Date.now
    
    var body: some View {
        VStack{
            Stepper("Enter your sleep hours: \(sleepamount.formatted())", value:$sleepamount, in: 6...10, step: 0.5)
            DatePicker("Please enter a date", selection: $datinha, in: Date.now... ,displayedComponents: .date)
                .labelsHidden()
        }
    }
}

#Preview {
    ContentView()
}
