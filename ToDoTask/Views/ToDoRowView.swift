//
//  ToDoRowView.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import SwiftUI

struct ToDoRowView: View {
    let item: TodoItemsModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    let item1 = TodoItemsModel(title: "First item!", isCompleted: false)
    let item2 = TodoItemsModel(title: "Second Item.", isCompleted: true)

    Group {
        ToDoRowView(item: item1)
        ToDoRowView(item: item2)
    }
}
