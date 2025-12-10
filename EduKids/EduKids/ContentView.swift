//
//  ContentView.swift
//  EduKids
//
//  Created by Beatriz Amorim Oliveira on 06/12/25.
//
// O jogador precisa selecionar quais tabuadas de multiplicação de 2 a 12 deseja. 
// O jogador deve poder selecionar quantas perguntas deseja responder: 5, 10 ou 20.
// Você deve gerar aleatoriamente tantas perguntas quantas forem solicitadas, dentro do nível de dificuldade especificado.
// Adicione algum estado para determinar se o jogo está ativo ou se você está solicitando configurações.
// Gere uma série de perguntas com base nas configurações do usuário.


import SwiftUI

struct ContentView: View {
    
    @State private var selectedTable = 2
    @State private var choosenQuestionNumber = 5
    @State private var questionNumbers = [5, 10, 15]
    @State private var arrayAnswers : [String] = []
    //    @State private var arrayMulitpliers = [Int]()
    @State private var arrayMultipliers: [Int] = []
    @State private var gameIsActive = true
    @State private var score = 0
    
    
    //view exigida pelo protocolo View e dentro dela podemos fazer outras
    var body: some View {
        NavigationStack {
            if gameIsActive {
                settingsView
            } else {
                gameView
            }
        }
        .navigationTitle("Jogo da Multiplicação")
    }
    
    var settingsView: some View {
        NavigationStack {
            Form {
                Section("Qual tabuada você quer praticar?") {
                    Stepper("Tabuada de \(selectedTable) ", value: $selectedTable, in: 2...12)
                }
                
                Section ("Número de questões") {
                    Picker("questões:", selection: $choosenQuestionNumber){
                        ForEach(questionNumbers, id: \.self) { text in
                            Text(text, format: .number)
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                Button("Começar jogo") {
                    gameIsActive = false
                    generateMultipliers()
                }
                //MELHORAR A APARÊNCIA DESSE BOTÃO
                
            }
        }
        .navigationTitle("Jogo da Multiplicação")
    }
    
    
    var gameView: some View {
        Form {
            Section ("Questões") {
                ForEach(arrayMultipliers.indices, id: \.self) { num in
                    HStack{
                        Text("\(selectedTable) x \(arrayMultipliers[num]) = ")
                        TextField("Resposta", text: $arrayAnswers[num])
                                                                                 
                    }
                }
            }
            Button("Recomeçar jogo"){
                gameIsActive = true
            }
        }
    }


    func generateMultipliers (){
        //Quando o usuário muda o número de questões criamos o array com os múltiplos pra serem utilizados e aí mostra as questões
        // PORQUE EU CRIO O ARRAY SÓ QUANDO CLICO O BOTÃO, porque não posso já deixar ele criado embaralhado e quando clicar no botão só cortar ele
        
        var possibleMultipliers = Array(1...30)
        possibleMultipliers.shuffle()
        
        let quantidadeElementos = min(choosenQuestionNumber, possibleMultipliers.count) //pega o menor valor entre esses dois
        
        arrayMultipliers = Array(possibleMultipliers.prefix(quantidadeElementos))
        arrayAnswers = Array(repeating: "", count: possibleMultipliers.count)
    }
    
    func checkAnswers(answer: Int, randomMultiplier: Int){ //queria executar esse função a cada iteração de entrada de resposta
        if  randomMultiplier * selectedTable == answer {
            score += 1
        }
    }
    
    
        
    
}



#Preview {
    ContentView()
}
