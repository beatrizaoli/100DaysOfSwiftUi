import SwiftUI

struct UserDefaultsView: View {
    
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        VStack (spacing: 30){
            HStack{
                Image(systemName: "arrowshape.up.fill")
                Button("Tap to icrement"){
                    tapCount += 1
                    UserDefaults.standard.set(tapCount, forKey: "Tap") //porque preciso colocar o user default na acão do botão e na variável?
                }
                .foregroundStyle(.green)
                .font(.headline)
            }
            Text("\(tapCount)")
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack{
                Image(systemName: "arrowshape.down.fill")
                Button("Tap to decrement"){
                    tapCount -= 1
                }
                .foregroundStyle(.red)
                .font(.headline)
            }
        }
    }
    
}


#Preview {
    UserDefaultsView()
}
