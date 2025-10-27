//
//  ContentView.swift
//  PaymentSplit
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0 //@State faz com que a var possa armazenar valor nessa view, o valor só muda se colocarmo o State, pois structs são constantes por padrão
    var body: some View {
        Button ("Tap Count: \(tapCount)" ){
            self.tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
