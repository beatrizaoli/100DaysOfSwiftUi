//
//  SwiftUIView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 06/11/25.
//

import SwiftUI

struct Title: ViewModifier { //cria um modifier personalizado
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}
extension View { //facilita o uso do modifier personalizado, poderá ser chamado só com o titleStyle
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct CapsuleText: View { //cria uma view pesonalizada
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct SwiftUIView: View {
    var body: some View {
        VStack{
            CapsuleText(text: "First")
            CapsuleText (text: "Second")
            Text("Third")
            Text("Forth")
                .modifier(Title())
            Text("Fifth")
                .titleStyle()
        }
    }
}

#Preview {
    SwiftUIView()
}
