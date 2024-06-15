//
//  RecordModel.swift
//  CodeDrop
//
//  Created by 신승아 on 6/15/24.
//

import Foundation
import SwiftData

@Model
class RecordModel {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var interestedThings: [String]
    var likeFoods: [String]
    
    init(id: UUID, name: String, interestedThings: [String], likeFoods: [String]) {
        self.id = id
        self.name = name
        self.interestedThings = interestedThings
        self.likeFoods = likeFoods
    }
}
