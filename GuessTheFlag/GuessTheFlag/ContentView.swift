//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

//pop up com um titulo, mensagem e butoes
//views são funções do estado do nosso aplicativo, então o alert deve ser colocado para aparecendo diante de uma condição
//criamos um @State para observar o valor que o alerta ta recebendo, meio que monitora o estado do valor, ai se algo aocntece ele consegue ler e trocar o estado do alerta
//Qualquer botão dentro da area de código do alert irá automaticamente descarta-lo, por isso não precisa de código só par fechar o pop up de alerta, mas precisa de código se quiser adicionar outra funcionalidade
//
struct ContentView: View {
    @State private var alertState = false
   
    var body: some View {
        Button("Alert button"){
            alertState = true
        }
        .alert("Important message", isPresented: $alertState) {
            Button("Delete", role: .destructive){} //fecha alerta
            Button("Cancel", role: .cancel){} //fecha alerta mas com papel de voltar pra pagina que estava
        } message: {
            Text ("This is a text for the alert, it appears under the title 'Important message' ")
        }
    }
}

#Preview {
    ContentView()
}
