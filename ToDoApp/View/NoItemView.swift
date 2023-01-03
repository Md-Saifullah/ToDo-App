//
//  NoItemView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 26/12/22.
//

import SwiftUI

struct NoItemView: View {
    @State private var animate: Bool = false

    private let colorFrom: Color = .init(#colorLiteral(red: 0.3, green: 0.4, blue: 0.6, alpha: 1))
    private let colorTo: Color = .init(#colorLiteral(red: 0.08707077056, green: 0.4981409311, blue: 0.7414988875, alpha: 1))

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                TextView(
                    title: "No Items",
                    fontSize: .title,
                    fontWeight: .semibold
                )

                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom)

                NavigationLink(
                    destination: AddItemView(),
                    label: {
                        Text("Add Something 🥳")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .background(animate ? colorFrom : colorTo)
                            .cornerRadius(30)
                    }
                )
                .padding(.horizontal, animate ? 30 : 45)
                .shadow(
                    color: animate ? colorFrom.opacity(0.9) : colorTo.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .navigationTitle("ToDo App 📝")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func addAnimation() {
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

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemView()
    }
}
