//
//  ContentView.swift
//  WordScramble
//
//  Created by Beatriz Amorim Oliveira on 21/11/25.
//
// .listStyle(.grouped) retira o padding natural da list e deixa cada text ficar contíduo e retangular

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        List {
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }
            
            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }
            
            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        .listStyle(.grouped)
    }
    
}


#Preview {
    ContentView()
}
