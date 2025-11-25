//
//  ContentView.swift
//  WordScramble
//
//  Created by Beatriz Amorim Oliveira on 21/11/25.
//


import SwiftUI
import Foundation

struct ContentView: View {
    
    var body: some View {
        }
    // FUNCIONALIDADE DE STRINGS
    func testStrings(){
        let spaceArray = "a b c"
        let separetedLetters1 = spaceArray.components(separatedBy: " ")
        
        let breaklineArray = """
            a
            b
            c
            """
        let separetedLetters2 = breaklineArray.components(separatedBy: "/n") ///n é o símbolo que representa breakline
            
        let letter = separetedLetters1.randomElement() //escolhe um elemento aleatório do array
        
        let trimed = letter?.trimmingCharacters(in: .whitespacesAndNewlines) //tira white spaces e newlines da string
    }
    
    // Verificar palavras com erros ortográficos.
    func checkingString (){
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count) //inicio e fim da palavra que irá verificar. Usa UTF16 para que o Objective-C possa entender como as strings do Swift são armazenadas, ele é um formato de ponte útil para conectarmos os dois.
        let misspelledReang = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en") //se não houver erro de ortografia ele retorna vazio (NSNotFound) dai fazemos uma verificação pra retorna verdadeiro ou falso nesse caso. Pois o objective-c não tinha optionals
        let allGood = misspelledReang.location == NSNotFound
    }
}
    



#Preview {
    ContentView()
}
