//
//  TodoViewModel.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import Foundation

class TodoViewModel: ObservableObject {
    
    @Published var todoItems: [TodoItems] = [] {
        didSet {
            saveToDoItem()
        }
    }
    
    init() {
        getToDoList()
    }
    
    func getToDoList() {
        todoItems = [TodoItems(title: "Wake up", isCompleted: false),
                     TodoItems(title: "Excerise", isCompleted: false),
                     TodoItems(title: "Work", isCompleted: false),
                     TodoItems(title: "Learning", isCompleted: false)]
    }
    
    func addNewToDoItem() {
        
    }
    
    func deleteToDoItem(indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
    
    func saveToDoItem() {
        print("Item saved")
    }
    
    
}
