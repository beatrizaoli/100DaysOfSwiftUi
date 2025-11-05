//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beatriz Amorim Oliveira on 27/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var scoreTitle = ""
    @State private var scoreAppears = false
    @State private var score = 0
    @State private var gameNumber = 0
    @State private var gameOver = false
    
    var body: some View {
        ZStack { //Faz a cor do background
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green:0.2, blue:0.45), location: 0.3),
                .init(color: Color(red: 0.76, green:0.15, blue:0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
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
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                //Cria a caixa translucida
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
    
    func flagTapped(_ number:Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, this is \(countries[number]) flag"
        }
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
    }
    
    func reset(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        gameNumber = 0
    }
    
}


#Preview {
    ContentView()
}
