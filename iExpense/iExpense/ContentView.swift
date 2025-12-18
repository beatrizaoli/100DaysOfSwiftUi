import SwiftUI

//Sheet é um modifier, faz com que uma nova view aparece na frente da antiga. aparece uma nova sheet a partir de uma condição
// Environment permite criar variáveis que armazenem valor fornecido para nós externamente



struct SeconView: View {
    
    @Environment(\.dismiss)  var closeSheet
    //a variável closeSheet recebe o valor da environmentValue dismiss. A dismiss é uma função permite que você feche programaticamente a view
    var body: some View {
        Text("You've asnwered, congrats for trying")
        Button("Close"){
            closeSheet()
        }
    }
}

@Observable
class FeedData {
    let title = "Gigante do Samba"
    let subtitle = "Autor de mais de 500 sambas estava afastado dos palcos desde que sofreu um AVC."
    var description = ""
}

struct ContentView: View {
    
    @State var outsideStruct = FeedData()
    @State var showSheet = false
    
    var body: some View {
        VStack{
            Text("Guess the Artist")
                .font(.largeTitle)
                .foregroundStyle(.red)
            VStack{
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text ("\(outsideStruct.title)")
                }
                Text("\(outsideStruct.subtitle)")
                Text("\(outsideStruct.description)")
                    .frame(width: 300, height: 100)
                    .background(.pink)
                    .font(.headline)
                TextField("Your asnwer...", text: $outsideStruct.description)
                    .background(.gray)
            }
            .padding(12)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(6)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
            Button ("Send Answer"){
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet){ //abre uma nova view que desliza para cima com o conteúdo que determinamos dentro dela e podemos remove-la puxando pra baixo
                SeconView()
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
