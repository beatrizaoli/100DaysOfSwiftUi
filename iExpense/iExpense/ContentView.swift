import SwiftUI


struct SeconView: View {
    @Environment(\.dismiss)  var closeSheet
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
    
    @State private var outsideStruct = FeedData()
    @State private var showSheet = false
    @State private var changeViews = false
    
    
    
    var body: some View {
        if changeViews {
            ListView()
        } else {
            VStack{
                renderTitle
                renderBoxContent
                renderAnswers
                renderSheetButton
                renderListAppearButton
            }
        }
    }
    
}


extension ContentView {
    var renderTitle: some View {
        Text("Guess the Artist")
            .font(.largeTitle)
            .foregroundStyle(.red)
    }
    
    var renderBoxContent: some View {
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
        }
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(6)
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(5)
    }
    
    var renderAnswers: some View {
        TextField("Your asnwer...", text: $outsideStruct.description)
            .background(.gray)
            .padding(.horizontal, 12)
    }
    
    var renderSheetButton: some View {
        Button ("Send Answer"){
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet){
            SeconView()
        }
    }
    
    var renderListAppearButton: some View {
        Button ("Click for list interaction"){
            changeViews = true
        }
        .padding(15)
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    
    
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
