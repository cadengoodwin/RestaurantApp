// Restaurant.swift

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var colorIndex: Int = 0
    var rating: Int = 0 // Added for storing star ratings
}

