//
//  ContentView.swift
//  BetterRest
//
//  Created by Beatriz Amorim Oliveira on 14/11/25.
//

import SwiftUI

//in cria um range, que limita o valor máximo e minimo
//step define os intervalos que irão aumentar e diminuir
//usa formatted() para que o número não seja tão preciso, sem ele imprimiria 8.000000, com ele só imprime as casas decimais necessárias
//A State var é  automaticamente do tipo Double ou Float, por isso temos vários zeros depois da virgula.  Assim quando a variável é interpolada o  Swift exibe a representação de precisão total do número de ponto flutuante, que inclui muitos zeros decimais, a menos que seja explicitamente formatado

struct ContentView: View {
    @State private var sleepamount =  8.0
    
    var body: some View {
        Stepper("\(sleepamount.formatted())", value:$sleepamount, in: 6...10, step: 0.5)
    }
}

#Preview {
    ContentView()
}
