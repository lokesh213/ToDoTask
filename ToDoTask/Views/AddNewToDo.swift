//
//  AddNewToDo.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import SwiftUI

struct AddNewToDo: View {
    @State var toDoTitle: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your ToDo...", text: $toDoTitle)
            Button("SAVE") {
                
            }
        }
    }
}

#Preview {
    AddNewToDo()
}
