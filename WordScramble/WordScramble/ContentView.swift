//
//  ContentView.swift
//  WordScramble
//
//  Created by Beatriz Amorim Oliveira on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        List {
            Text("Static row 1")
            Text("Static row 2")
            Text("Static row 3")
            Spacer()
            ForEach(0..<5) {
                    Text("Dynamic row \($0)")
            }
        }

    }
}

#Preview {
    ContentView()
}
