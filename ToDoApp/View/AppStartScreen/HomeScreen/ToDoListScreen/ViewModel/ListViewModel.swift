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

    func addItem(_ item: Item, onCompletion: @escaping (Bool) -> Void) {
        let todo = Todo(
            id: Int(item.id) ?? 0,
            user_id: UserViewModel().user.id,
            title: item.title,
            due_on: self.dateToString(date: item.dueDate),
            status: item.isCompleted ? "completed" : "pending")

        print("first\n\(item)")
        networkManager.createTodo(todo) { data in
            guard let safeData = data else {
                onCompletion(false)
                return
            }

            let item = Item(
                id: String(safeData.id),
                title: safeData.title,
                dueDate: self.stringToDate(dateString: safeData.due_on) ?? Date(),
                isCompleted: safeData.status == "completed" ? true : false)
            print("second\n\(item)")
            onCompletion(true)
            self.items.append(item)
        }
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
            networkManager.getUserToDo(id: UserViewModel().user.id) { items in
                if let items = items {
                    for item in items {
                        self.items.append(Item(
                            id: String(item.id),
                            title: item.title,
                            dueDate: self.stringToDate(dateString: item.due_on) ?? Date(),
                            isCompleted: item.status == "completed" ? true : false))
                    }
                    print("third\n\(items)")
                }
            }
        } else {
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
        formatter.dateStyle = .short
        if let date = formatter.date(from: dateString) {
            print(date)
            return date
        }
        print("came here")
        return nil
    }

    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
