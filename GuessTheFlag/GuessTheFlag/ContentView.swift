//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//
// Ao tocar em uma bandeira, faça-a girar 360 graus em torno do eixo Y.
// Faça com que os outros dois botões desapareçam gradualmente até atingirem 25% de opacidade.
// Adicione um terceiro efeito à sua escolha às duas bandeiras que o usuário não selecionou – talvez fazê-las diminuir de tamanho? Ou inverter a direção? Experimente!

import SwiftUI

struct FlagImage: ViewModifier {
    func body (content: Content) -> some View {
        content
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct BlueTitle: ViewModifier {
    func body (content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.yellow)
    }
}
extension View {
    func blueTitleStyle () -> some View {
        modifier(BlueTitle())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var scoreTitle = ""
    @State private var scoreAppears = false
    @State private var score = 0
    @State private var gameNumber = 0
    @State private var gameOver = false
    @State private var clickedFlag = -1
    @State private var opacityAmount = 1.0

    var body: some View {
        ZStack { 
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green:0.2, blue:0.45), location: 0.3),
                .init(color: Color(red: 0.76, green:0.15, blue:0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Guess the flag")
                    .blueTitleStyle()
                
                VStack (spacing: 15){
                    VStack {
                        Text("Tap the flag:")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){number in
                        Button{
                            flagTapped(number)
                            } label:{
                            Image(countries[number])
                                .modifier(FlagImage())
                                .rotation3DEffect(.degrees(number == clickedFlag ? 360 : 0), axis: (x: 0, y: 1, z: 10))
                                .opacity(number == clickedFlag ? 1 : opacityAmount)
                                .scaleEffect(number == clickedFlag ? 1.25 : opacityAmount)
                                .animation(.easeOut(duration: 1), value: opacityAmount)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("SCORE: \(score) ")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
            }
            .padding()
            
            .alert(scoreTitle, isPresented: $scoreAppears){
                Button("Continue Playing", action: askQuestion)
            } message :{
                Text("Your score is \(score) ")
            }
            
            .alert("Game Over", isPresented: $gameOver){
                Button ("Play again", action: reset)
            } message :{
                Text ("\(scoreTitle)!! You've played 8 times, and got \(score) points")
            }
            
        }
    }
    
    func flagTapped(_ numTapped:Int){
        
        //Animação
        clickedFlag = numTapped
        opacityAmount -= 0.9
       
        
        // Pontuação
        if numTapped == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, this is \(countries[numTapped]) flag"
        }
        
        // Número de jogos - Fim de jogo
        gameNumber += 1
        if gameNumber == 8 {
            gameOver = true
        } else {
            scoreAppears = true
        }

    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        clickedFlag = -1
        opacityAmount = 1
    }
    
    func reset(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        gameNumber = 0
        clickedFlag = -1
        opacityAmount = 1
    }
    
}


#Preview {
    ContentView()
}
