//
//  ListView.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 21/12/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        NavigationView {
            if listViewModel.items.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
                .listStyle(.plain)
                .padding(.top)
                .navigationTitle("ToDo App 📝")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddItemView()) {
                            Image(systemName: "note.text.badge.plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
            }
        }
    }

    private func deleteItem(indexSet: IndexSet) {
        listViewModel.deleteItem(at: indexSet)
    }

    private func moveItem(indexSet: IndexSet, to: Int) {
        listViewModel.moveItem(from: indexSet, to: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ListViewModel())
    }
}
