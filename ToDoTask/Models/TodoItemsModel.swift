//
//  TodoItems.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import Foundation

struct TodoItemsModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TodoItemsModel {
        return TodoItemsModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
