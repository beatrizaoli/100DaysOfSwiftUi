//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//
//Vinculamos o modificador animation() ao stepper pois ele pode ser vinculado a qualquer view.
//Nesse caso não precisamos especificar qual valor estamos monitorando para detectar alterações ele está literalmente vinculado ao valor que deve monitorar!
import SwiftUI

struct ContentView: View {
    
    @State private var amount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $amount
                .animation(.easeInOut(duration: 1).repeatCount(3, autoreverses: true))
                    , in: 1...10
            )
            
            Spacer()
            
            Button("Tap Me") {
                amount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(amount)
        }
    }
}

#Preview {
    ContentView()
}
