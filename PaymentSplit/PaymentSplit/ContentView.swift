//
//  ContentView.swift
//  PaymentSplit
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    var body: some View {
        Form {
            TextField("Enter your name", text: $name) //um cifrão antes do nome de uma propriedade, cria uma ligação bidirecional: o valor da propriedade é lido, mas também escrito.
            Text ("Hello \(name)")
        }
    }
}

#Preview {
    ContentView()
}
