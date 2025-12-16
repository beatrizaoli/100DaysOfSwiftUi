import Foundation

struct questionData: Identifiable {
    let id = UUID()
    let multiplier: Int
    let correctProduct: Int
    var userAnswer: String = ""
}
