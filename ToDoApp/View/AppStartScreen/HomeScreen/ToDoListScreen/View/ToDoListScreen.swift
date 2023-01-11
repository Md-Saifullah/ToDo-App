//
//  ToDoListScreen.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct ToDoListScreen: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        if listViewModel.items.isEmpty {
            EmptyListScreen()
        } else {
            List {
                ForEach(listViewModel.items) { item in
                    ToDoListRowView(item: item)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
            .listStyle(.plain)
            .padding(.top)
        }
    }

    private func deleteItem(indexSet: IndexSet) {
        listViewModel.deleteItem(at: indexSet)
    }

    private func moveItem(indexSet: IndexSet, to: Int) {
        listViewModel.moveItem(from: indexSet, to: to)
    }
}

struct ToDoListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListScreen()
            .environmentObject(ListViewModel())
    }
}
