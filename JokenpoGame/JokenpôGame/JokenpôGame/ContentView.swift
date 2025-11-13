//
//  ContentView.swift
//  JokenpôGame
//
//  Created by Beatriz Amorim Oliveira on 11/11/25.
//
// Pedra vence tesoura, tesoura vence papel e papel vence pedra
// 1. o App escolhe aleatoriamente um simbolo e se o jogador deve perder ou ganhar
// 2. o Jogador deve escolher um simbolo, caso o Jogador tenha escolhido o simbolo de acordo com o que o app mandou ele fazer ele ganha ponto. Ou seja se o app escolher pedra e falar pro jogar ganhar, o jogador deve escolher o simbolo que ganha de pedra que é papel para ganhar ponto, obedecendo a ordem do App.
//3. Se o jogador tiver correto ganha um ponto e se tiver errado perde um ponto e o jogo termina depois de 10 jogadas

import SwiftUI

struct ContentView: View {
    let moves = ["rock", "paper", "scissors"]
    @State private var appMove = Int.random(in: 0...2)
    @State var playerWin = Bool.random() //togle()
    @State var gameRound = 0
    @State var playerScore = 0
    @State var endGameAlert = false
    
    
    var body: some View {
        VStack {
            VStack{
                Text("Rock, Paper, Scissors")
                Text("Player's Score is: \(playerScore)")
                Text("App's move: \(moves[appMove]) ")
                Text (playerWin ? "You must WIN" : "You must LOOSE")
                HStack {
                    ForEach(0..<3){ number in
                        Button {moveTapped(number)
                        } label: {
                            Text(moves[number])
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                }
            }
            .alert("Game Over", isPresented: $endGameAlert) {
                Button("Play Again", action: resetGame)
            } message: {
                Text("You've played 10 rounds, and your score is \(playerScore)")
            }
            .padding()
        }
    }
    
    func moveTapped (_ playerMove: Int){
        let result = (playerMove - appMove + 3) % 3
        // se 1, jogador ganha, se 2 jogador perde, se 0 teve empate
        if  playerWin {
            switch result {
            case 1 : playerScore += 1
            case 2 : playerScore -= 1
            case 0 : playerScore -= 1
            default : playerScore += 0
            }
        } else {
            switch result {
            case 1 : playerScore -= 1
            case 2 : playerScore += 1
            case 0 : playerScore += 1
            default : playerScore += 0
            }
        }
        
        gameRound += 1
        if gameRound > 10 {
            endGameAlert = true
        } else {
            setupNextRound()
        }
    }
    
    func setupNextRound() {
        appMove = Int.random(in: 0...2)
        playerWin = Bool.random()
    }
    
    func resetGame() { //vai dentro do alerta para começar tudo dnv
        playerScore = 0
        gameRound = 1
        setupNextRound()
    }
}
#Preview {
    ContentView()
}
