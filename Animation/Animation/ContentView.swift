//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundStyle(.white)
            .animation(nil, value: enabled) //usa nil para manter animação da forma com bounce, mas não interferir na cor, ela ficará sem mudança suave, e se tirasse esse animation o sprng ia animar a cor e se mover o background para baixo o clipshape não funciona
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 3, bounce: 0.6), value: enabled)
        
    }
}

#Preview {
    ContentView()
}
