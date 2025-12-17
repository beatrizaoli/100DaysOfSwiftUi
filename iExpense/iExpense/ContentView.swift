import SwiftUI

@Observable //sem observable os valores dentro da nossa classe são alterados, mas a visualização não é recarregada para refletir essa mudança.
class FeedData {
    let title = "Gigante do Samba"
    let subtitle = "Autor de mais de 500 sambas estava afastado dos palcos desde que sofreu um AVC."
    var description = ""
}

struct ContentView: View {
    
    @State var outsideStruct = FeedData()
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text ("\(outsideStruct.title)")
            }
            Text("\(outsideStruct.subtitle)")
            Text("\(outsideStruct.description)")
                .frame(width: 300, height: 100)
                .background(.red)
                .font(.headline)
            TextField("Write the asnwer...", text: $outsideStruct.description)
                .background(.gray)
        }
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(6)
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(5)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
