//
//  ContentView.swift
//  WordScramble
//
//  Created by Beatriz Amorim Oliveira on 21/11/25.
//
// itera sobre o array, criando uma linha de list para cada elemento. Precisa usar id: \.self para que os elementos tenham um id unico. Isso funciona muito bem porque o SwiftUI consegue identificar cada linha de forma única com base em seu id.

import SwiftUI

struct ContentView: View {
    
    let people = ["eleven", "will", "lucas", "mike", "dustin", "max"]
    
    var body: some View {
        
        List (0..<5) {
            Text("Message \($0)")
        }
        
        List (people, id: \.self){
            Text("\($0)")
        }
    }
    
}


#Preview {
    ContentView()
}
