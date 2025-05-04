//
//  TodoListView.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var vm: TodoViewModel
    
    var body: some View {
        ZStack {
            if vm.todoItems.isEmpty {
                NoToDoItem()
            } else {
                List {
                    ForEach(vm.todoItems, id: \.id) { item in
                        ToDoRowView(item: item)
                            .onTapGesture {
                                withAnimation(.smooth, {
                                    vm.updateItem(item: item)
                                })
                            }
                    }
                    .onDelete(perform: vm.deleteItem)
                    .onMove(perform: vm.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .onAppear() {
            vm.getItem()
        }
        .navigationTitle("ToDo List")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }

            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddNewToDo()
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
    .environmentObject(TodoViewModel())

}

