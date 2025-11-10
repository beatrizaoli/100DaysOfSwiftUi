//
//  SwiftUIView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 06/11/25.
//

import SwiftUI

//CUSTOM CONTEINERS

struct GridStack <X: View>: View {
    //X é um tipo genérico, nós criamos ele na hora de declarar a struct e ele tem conformidade com o protcolo View, além da Struct Gridstack tem também conformidade com o protocolo view.
    //O parâmetro genérico permite que você use Text, Image, Button ou qualquer outra View dentro do grid.
    let rows:Int
    let columns:Int
    
    let content: (Int, Int) -> X
    //uma closure que pede dois parametros inteiros e retorna o tipo geneérico
    //Ints serão o índice da linha e da coluna, respectivamente, e deve retornar uma View
    //
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
    //Só terá conformidade com o protocolo View quando adiciona essa propriedade computada body, some view
    //O corpo da var bodt define como a GridStack será montada
}
//Quando usarmos esse struct de conteiner novo que criamos, GridStack, vamos declarar a rows e a colums

struct SwiftUIView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) {row, col in
                Text("R\(row) C\(col)")
        }
    }
}

#Preview {
    SwiftUIView()
}
