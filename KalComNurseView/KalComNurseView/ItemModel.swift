//
//  ItemModel.swift
//  KalComNurseView
//
//  Created by admin on 11/23/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    var roomNumber: String

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, roomNumber: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.roomNumber = roomNumber
    }

    func updateCompletion() -> ItemModel {
        var updatedItem = self
        updatedItem.isCompleted.toggle()
        return updatedItem
    }
}
