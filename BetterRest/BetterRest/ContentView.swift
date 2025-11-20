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
    
    var body: some View {
        VStack{
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
        }
    }
}

#Preview {
    ContentView()
}
