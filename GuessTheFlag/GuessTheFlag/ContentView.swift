//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack (spacing: 0){
                Color.blue
                Color.red
            }
            Text("Hi")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
