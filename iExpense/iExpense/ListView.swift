import SwiftUI

//ON DELETE É DELETE DE SWIPE PRO LADO
//ON DELETE COM EDITBUTTON DA TOOLBAR DA NAVIGATIONSTACK PODE DELETAR CLICANDO NO BOTÃO

struct ListView: View {
    
    @State private var numbers = [1,2,3,4]
    @State private var currentNumber = 5
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows) //on delerette identifica qual indice do array você clicou
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("Listinha que deleta")
            .toolbar{
                EditButton()
            }
        }
    }
    
    func removeRows(offsets: IndexSet) {
        //indexSet é um tipo com número inteiros ordenados, guarda a sequencia de indices de um array/set como um intervalo
        numbers.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ListView()
}
