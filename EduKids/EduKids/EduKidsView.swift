import SwiftUI


struct EduKidsView: View {
    
    @State private var selectedTable = 2
    @State private var choosenQuestionNumber = 5
    @State private var questionNumbers = [5, 10, 15]
    
    @State private var gameIsActive = false
    @State private var score = 0
    
    @State private var questionArray: [questionData] = []
    
    @State private var endgame = false
    
    
    var body: some View {
        NavigationStack {
            Group{
                if gameIsActive {
                    gameView
                } else {
                    settingsView
                }
            }
            .navigationTitle(gameIsActive ? "Jogo" : "Configurações")
        }
    }
    
    
    var settingsView: some View {
        ZStack {
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
                    .pickerStyle(.segmented)
                }
            }
            
            Button("Começar"){
                gameIsActive = true
                generateQuestions()
            }
            .padding(.horizontal, 40)
            .frame(width: 180, height: 100)
            .font(.headline)
            .foregroundColor(.white)
            .background(.gray)
            .cornerRadius(10)
        }
    }
    
    
    var gameView: some View {
        VStack (spacing: 10){
            List ($questionArray) { $num in
                HStack{
                    Text("\(selectedTable) x \(num.multiplier) = ")
                    TextField("Resposta", text: $num.userAnswer)
                }
            }
            .frame(maxHeight: .infinity)
            
            Text("Score: \(score)")
                .font(.title2.bold())
                .padding(.bottom, 10)
            
            Button("Recomeçar jogo"){
                resetGame()
            }
            
            Button(action: checkAnswers){
                HStack{
                    Text("Verificar Respostas")
                    Image(systemName: "paperplane")
                }
            }
            .alert("Fim de Jogo", isPresented: $endgame){
                Button ("Jogar Novamente", action: resetGame)
            } message: {
                Text("Sua pontuação final: \(score)")
            }
            
        }
    }
        

    func generateQuestions() {
        var possibleMultipliers = Array(1...30)
        possibleMultipliers.shuffle()
        
        let multipliersCount = min(choosenQuestionNumber, possibleMultipliers.count)
        let uniqueMultipliers = possibleMultipliers.prefix(multipliersCount)
        
        questionArray = uniqueMultipliers.map { multiplier in
            let product = selectedTable * multiplier
            return questionData(multiplier: multiplier, correctProduct: product)
        }
    }
    
    func checkAnswers(){
        score = 0
        for i in questionArray.indices {
            let userAnswerInt = Int(questionArray[i].userAnswer) ?? 0
            if userAnswerInt == questionArray[i].correctProduct {
                score += 1
            }
        }
        endgame = true
    }
        
    func resetGame(){
        score = 0
        gameIsActive = false
        questionArray = []
        endgame = false
    }
    
        
    
}



#Preview {
    EduKidsView()
}
