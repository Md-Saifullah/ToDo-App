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

    static var fromNetwork: Bool = false
    private let networkManager = NetworkManager()
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

    private func getItems() {
        if ListViewModel.fromNetwork {
            print("from network")
            networkManager.getUserToDo(id: UserViewModel().user.id) { items in
                if let items = items {
                    for item in items {
                        self.items.append(Item(
                            id: String(item.id),
                            title: item.title,
                            dueDate: self.stringToDate(dateString: item.due_on) ?? Date(),
                            isCompleted: item.status == "completed" ? true : false))
                    }
                }
            }
        }
        else {
            print("not from network")
            guard
                let data = UserDefaults.standard.data(forKey: itemsKey),
                let decodedData = try? JSONDecoder().decode([Item].self, from: data)
            else { return }
            items = decodedData
        }
    }

    private func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

    private func stringToDate(dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.date(from: dateString)
    }
}
