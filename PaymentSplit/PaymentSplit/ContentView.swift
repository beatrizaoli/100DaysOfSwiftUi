//
//  ContentView.swift
//  PaymentSplit
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Text ("Form Text")
            Text ("Form Text")
            Text ("Form Text")
            Text ("Form Text")
            Text ("Form Text")
            Text ("Form Text")
        }
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
    }
}

#Preview {
    ContentView()
}
