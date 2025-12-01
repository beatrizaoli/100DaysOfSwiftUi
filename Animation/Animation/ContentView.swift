//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//
//Aonde vai a animacao ela vai aonde ocorre a mudanca de estado pois a mudanca reconstruirá a view e a recostrução virá animada
//O que sera animado é a construção

import SwiftUI

struct ContentView: View {
    
    @State private var showing = false
    
    var body: some View {
        
        Button("Tap me") {
            withAnimation{ //anima a mudanca visual que acontece com a mudança de estado, se mudou o estado, reconstruiu a view e vai reconstruir ela coma animaçãi
                showing.toggle()
            }
        }
        
        
        if showing {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 300)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
            
        }
    }

}

#Preview {
    ContentView()
}
