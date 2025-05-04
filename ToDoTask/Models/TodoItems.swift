//
//  TodoItems.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import Foundation

struct TodoItems: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
