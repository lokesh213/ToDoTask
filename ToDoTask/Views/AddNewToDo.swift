//
//  AddNewToDo.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import SwiftUI

struct AddNewToDo: View {
    @EnvironmentObject var vm: TodoViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var todoTextfield: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        VStack {
            TextField("Type Something here...", text: $todoTextfield)
                .padding(.horizontal)
                .frame(height: 55.0)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 9.0))
                .padding(.horizontal)
            
            Button {
                performSaveButton()
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55.0)
                    .background(Color.purple)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 9.0))
                    .padding()
            }
            Spacer()
        }
        .navigationTitle("Add Item ➕")
        .alert(Text(alertTitle), isPresented: $showAlert) {
            
        }
    }
    
    //MARK: - FUNCTIONS
    func performSaveButton() {
        guard checkTextIsValid() else { return }
        vm.newItem(newTitle: todoTextfield)
        dismiss()
    }
    
    func checkTextIsValid() -> Bool {
        guard todoTextfield.count > 3 else {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
}

#Preview {
    NavigationStack {
        AddNewToDo()
    }
    .preferredColorScheme(.dark)
    .environmentObject(TodoViewModel())

}
