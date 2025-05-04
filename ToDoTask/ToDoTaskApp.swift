//
//  ToDoTaskApp.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import SwiftUI

@main
struct ToDoTaskApp: App {
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TodoListView()
            }
            .environmentObject(todoViewModel)
        }
    }
}
