//
//  File.swift
//  EduKids
//
//  Created by Beatriz Amorim Oliveira on 14/12/25.
//

import Foundation

struct questionData: Identifiable {
    let id = UUID()
    let multiplier: Int
    let correctProduct: Int
    var userAnswer: String = ""
    var isAnswered: Bool = false
}
