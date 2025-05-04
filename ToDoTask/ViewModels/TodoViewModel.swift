//
//  TodoViewModel.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import Foundation

class TodoViewModel: ObservableObject {
    let itemsKey: String = "items_list"
    @Published var todoItems: [TodoItemsModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    init() {
        getItem()
    }
    
    func getItem() {
        guard
            let decodedData = UserDefaults.standard.data(forKey: itemsKey),
            let items = try? JSONDecoder().decode([TodoItemsModel].self, from: decodedData)
        else { return }
        todoItems = items
    }
    
    func saveItem() {
        if let encodeData = try? JSONEncoder().encode(todoItems) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
    func newItem(newTitle: String) {
        let newTodo = TodoItemsModel(title: newTitle, isCompleted: false)
        todoItems.append(newTodo)
    }
    
    func deleteItem(indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet: IndexSet, to: Int) {
        todoItems.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func updateItem(item: TodoItemsModel) {
        if let index = todoItems.firstIndex(where: {$0.id == item.id }) {
            todoItems[index] = item.updateCompletion()
        }
    }
    
}
