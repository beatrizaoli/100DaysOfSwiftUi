//
//  SwiftUIView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 06/11/25.
//

import SwiftUI

//Quando adicionar um novo modificador de visualização e quando adicionar uma nova View: os modifiers personalizados podem ter suas próprias propriedades armazenadas, enquanto as extensões não podem.

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


struct Watermark: ViewModifier { //cria um modfier personalizado com uma nova estrutura de visualização
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}
extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
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
        ZStack{
            Color.green
                .frame(width: 300, height: 550)
                .watermarked(with: "Hacking with Swift")
            VStack{
                CapsuleText(text: "First")
                CapsuleText (text: "Second")
                Text("Third")
                Text("Forth")
                    .modifier(Title())
                Text("Fifth")
                    .titleStyle()
                // first e second são iguais
                // forth e fifth são iguais
             
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
