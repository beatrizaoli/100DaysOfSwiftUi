//
//  ContentView.swift
//  WordScramble
//
//  Created by Beatriz Amorim Oliveira on 21/11/25.
//
//Não serão aceitas respostas com menos de três letras ou que sejam apenas a nossa palavra inicial.
//Adicione um botão na barra de ferramentas que execute o comando startGame(), para que os usuários possam reiniciar com uma nova palavra sempre que desejarem.
//Adicione uma visualização de texto em algum lugar para que você possa acompanhar e exibir a pontuação do jogador para uma determinada palavra-raiz. Ganha 3 pontos pra 3 letras, 4 pra 4 letras... e a cada 5 palavras ganha +5 pontos
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var useWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Type a word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ForEach(useWords, id: \.self) { palavra in
                        HStack{
                            Image(systemName: "\(palavra.count).circle")
                            Text(palavra)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .onSubmit(addNewWord)
            .alert(errorTitle, isPresented: $showingError){} message: {
                Text(errorMessage)}
            .toolbar {
                Button("StartGame", action: startGame)
            }
            HStack{
                Text("Score: \(score)")
            }
        }
    }

    
    func startGame(){
        if let fileStartTxt = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileStartTxt, encoding: .utf8){
                let allWords = fileContents.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silworm"
                useWords = []
                score = 0
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }

    
    func addNewWord (){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count >= 3 else {
            wordError(title: "Word little then 3 char", message: "You need to write more!")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word already exists, dont copy", message: "Be more original")
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
        withAnimation{
            useWords.insert(answer, at: 0)
        }
        newWord = ""
        
        score += answer.count
        if useWords.count % 5 == 0  {score += 5}
    
    }
    

    func isOriginal(word: String) -> Bool {
        !useWords.contains(word) && word != rootWord
    }
    
    func isPossible (word:String) -> Bool {
        var copyRoot = rootWord
        
        for letter in word {
            if let pos = copyRoot.firstIndex(of: letter){
                copyRoot.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
        
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}


#Preview {
    ContentView()
}
