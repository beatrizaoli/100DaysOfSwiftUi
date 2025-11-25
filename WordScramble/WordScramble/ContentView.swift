//
//  ContentView.swift
//  WordScramble
//
//  Created by Beatriz Amorim Oliveira on 21/11/25.
//

// primeiro busca o arquivo de nome somefile e extensão txt
// if let é crucial porque, se você errar o nome ou a extensão, ou se o arquivo não estiver incluído no projeto, o Swift retorna nil, e o aplicativo não deve travar
//Assim que obtém o endereço (fileURL), precisamos carregar o conteúdo do arquivo na memória do aplicativo.
//Ele deve ser carregado como um Data(contentsOf: fileURL) que é o formato binário bruto de qualquer arquivo e o try? é usado para que data seja nill caso o carregamento do arquivo falhe.
//MAaaas no exemplo como foi carrega um arquivo de texto ele precisa ser convertido para um formato do swift (String, struct) e em enconding coloca-se o dicionário usado para transformar o Data (os bytes) em uma String (o texto).

import SwiftUI
import Foundation

struct ContentView: View {
    
    var body: some View {
        }
    
    func loadBundles(){
        if let fileUrl = Bundle.main.url(forResource: "somefile", withExtension: "txt"){
            if let fileContents = try? String(contentsOf: fileUrl, encoding: .utf8){} 
        }
    }
}
    



#Preview {
    ContentView()
}
