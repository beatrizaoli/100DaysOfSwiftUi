//
//  ContentView.swift
//  Animation
//
//  Created by Beatriz Amorim Oliveira on 27/11/25.
//


import SwiftUI

struct CornerRotateModifier: ViewModifier {
    //struct em conformidade com o protocolo ViewModifier, permitindo que  altere o comportamento e a aparência de outras views
    let amount: Double
    let anchor: UnitPoint //define o ponto fixo (pivot) em torno do qual a view girará
    
    func body (content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

//Anytransition é um struct no SwiftUI que permite criar transições animadas personalizadas para a inserção e remoção de visualizações na interface
//Entrada: A view começa no estado active (girada -90°) e se anima para o estado identity (girada 0°).
//Saída: A view começa no estado identity (girada 0°) e se anima para o estado active (girada -90°).
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


struct ContentView: View {
    
    @State private var showing = false
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if showing {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot) //adiciono a variável que eu criei pra controlar a transição
            }
        }
        .onTapGesture {
            withAnimation {
                showing.toggle()
            }
        }
    }

    
}

#Preview {
    ContentView()
}
