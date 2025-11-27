//
//  ContentView.swift
//  WordScramble
//
//  Created by Beatriz Amorim Oliveira on 21/11/25.
//
// método ".firstIndex(of: element)" significa exatamente: Encontre a primeira posição (índice) onde element aparece.

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var useWords = [String]() //array vazio inicializado, se tivesse valor já seria inicializado, mas sem valor precisa ser inicializado explicitamente com o uso de parenteses para que seja compilado,
    @State private var newWord = ""
    @State private var rootWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    
//- VIEW
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Type a word", text: $newWord)
                        .textInputAutocapitalization(.never) //tira as maiúsculas automáticas
                }
                Section { //cria uma lista com os valores do array
                    ForEach(useWords, id: \.self) { palavra in
                        HStack{
                            Image(systemName: "\(palavra.count).circle")
                            Text(palavra)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            //.onSubmit{addNewWord()} //menos direto, ideal para quando tem parametro, mas ambos funcionam
            .onAppear(perform: startGame)
            .onSubmit(addNewWord)
            .alert(errorTitle, isPresented: $showingError){
                
            } message: { Text(errorMessage)}
        }
    }

    
    func startGame(){
        if let fileStartTxt = Bundle.main.url(forResource: "start", withExtension: "txt") { //puxamos o file pra variável, daí se atribuir, é true. Assim, existe if porque precisa conferir se o arquivo existe atribui
            if let fileContents = try? String(contentsOf: fileStartTxt, encoding: .utf8){ // pegamos o conteúdo do file
                let allWords = fileContents.components(separatedBy: "\n") //colocamos o conteudo do file em strings separadas
                rootWord = allWords.randomElement() ?? "silworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }

    
    func addNewWord (){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) //se coloco uma palavra com espaço ele continua aparecendo
        
        guard answer.count > 0 else {return}
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation{ //também pode usar parenteses ou chaves aqui
            useWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    //faz uma função e depois coloca ela no guard dentro de outra func ao invés de fazer um if porque ficaria muito aninhado, então você ver que ficaria muito aninhado já em criar métodos separados que podem se conectar depois
    func isOriginal(word: String) -> Bool { // verifica se a palavra do usuário ta no array, se tiver é false e faz o else do guar isOriginal, se não tiver é true e pode continuar
        !useWords.contains(word)
    }
    
    func isPossible (word:String) -> Bool {
        var copyRoot = rootWord
        
        for letter in word { //pra cada letra da palavra inserida
            if let pos = copyRoot.firstIndex(of: letter){ // verifica se o letter existe em copyroot e se encontrar, ele retorna a posição (o índice) de letter, atribuindo esse índice a constante criada, daí tira o elemento dessa posicao da copyroot e verifica a próxima letra
                copyRoot.remove(at: pos)
            } else {
                
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker() //analisar strings em busca de palavras com erros ortográficos
        let range = NSRange(location: 0, length: word.utf16.count) //analisa toda a extensão da string
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en") //finalmente usa o verificador de texto em si, com os parâmetros criados
        return misspelledRange.location == NSNotFound
    }
        
    func wordError(title: String, message: String) { //chamado nos casos de erro previstos
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

    



#Preview {
    ContentView()
}
