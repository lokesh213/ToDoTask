//
//  NoToDoItem.swift
//  ToDoTask
//
//  Created by Lokesh on 04/05/25.
//

import SwiftUI

struct NoToDoItem: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("There are no items!")
                .font(.title)
                .fontWeight(.semibold)
            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                .padding(.bottom, 20)
            
            NavigationLink(destination: AddNewToDo()) {
                Text("Add Something 🥳")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? .purple : .gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
            .padding(.horizontal, animate ? 30 : 50)
            .shadow(color: animate ? .purple : .gray, radius: 30, x: 0, y: 30)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)

        }
        .frame(maxWidth: 400)
        .padding(40)
        .multilineTextAlignment(.center)
        .onAppear(perform: addAnimation)

    }
    
    //MARK: - FUNCTIONS
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
            
        }
    }
}

#Preview {
    NoToDoItem()
}
