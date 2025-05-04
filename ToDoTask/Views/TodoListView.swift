//
//  TodoListView.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(todoViewModel.todoItems, id: \.id) { item in
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                        Text(item.title)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("ToDo List")
        .toolbar {
            ToolbarItem(id: "Add") {
                
                
                Button("Add") {
                    
                }
            }
        }
        
        


        
        
    }
}

#Preview {
    NavigationStack {
        TodoListView()
    }
    .navigationTitle("To Do")

}

