//
//  ContentView.swift
//  PaymentSplit
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    Text ("Form Text")
                    Text ("Form Text")
                    Text ("Form Text")
                }
                Section{
                    Text ("Form Text")
                    Text ("Form Text")
                    Text ("Form Text")
                }
            }
            .navigationTitle("Titulo")
        }
    }
}

#Preview {
    ContentView()
}
