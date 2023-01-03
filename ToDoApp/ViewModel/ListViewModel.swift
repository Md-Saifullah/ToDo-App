//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 26/12/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [Item] = [] {
        didSet {
            saveItems()
        }
    }

    private let itemsKey: String = "items"

    init() {
        getItems()
    }

    func addItem(_ item: Item) {
        items.append(item)
    }

    func deleteItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func deleteItem(_ item: Item) {
        items.remove(at: getIndex(of: item))
    }

    func moveItem(from indexSet: IndexSet, to: Int) {
        items.move(fromOffsets: indexSet, toOffset: to)
    }

    func updateItem(_ item: Item) {
        items[getIndex(of: item)] = item
    }

    func clearItems() {
        items = []
    }

    private func getIndex(of item: Item) -> Int {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return 0 }
        return index
    }

    // MARK: Storage part

    private func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([Item].self, from: data)
        else { return }
        items = decodedData

        // MARK: remove last

        items.append(contentsOf: [Item(title: "first and also long text for testing purpose", dueDate: Date.now, isCompleted: true),
                                  Item(title: "second", dueDate: Date.now, isCompleted: true),
                                  Item(title: "third", dueDate: Date.now, isCompleted: false),
                                  Item(title: "fourth", dueDate: Date.now, isCompleted: false),
                                  Item(title: "fourth", dueDate: Date.now, isCompleted: false),
                                  Item(title: "second", dueDate: Date.now, isCompleted: true)])
    }

    private func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
