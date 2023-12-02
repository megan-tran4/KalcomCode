//
//  ListViewModel.swift
//  KalComNurseView
//
//  Created by admin on 11/22/23.
//
import Foundation

class ListViewModel: ObservableObject {
    
    @Published var roomLists: [String: [ItemModel]] = [:] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
        
        // Simulating requests for Room 321 and Room 341
        let room222Requests = [
            ItemModel(title: "Bandages", isCompleted: false, roomNumber: "222"),
            ItemModel(title: "Medication", isCompleted: false, roomNumber: "222"),
            ItemModel(title: "EMERGENCY", isCompleted: false, roomNumber: "222"),
            ]
        roomLists["222"] = room222Requests
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.roomLists = Dictionary(grouping: savedItems, by: { $0.roomNumber })
    }

    func deleteItem(indexSet: IndexSet, room: String) {
        roomLists[room]?.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int, room: String) {
        roomLists[room]?.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, room: String) {
        let newItem = ItemModel(title: title, isCompleted: false, roomNumber: room)
        if roomLists[room] != nil {
            roomLists[room]?.append(newItem)
        } else {
            roomLists[room] = [newItem]
        }
    }
    
    func updateItem(item: ItemModel, room: String) {
        if let index = roomLists[room]?.firstIndex(where: { $0.id == item.id }) {
            var updatedItem = item.updateCompletion()
            updatedItem.roomNumber = room
            roomLists[room]?[index] = updatedItem

            // Simulate a delay and then delete the item
            Task {
                await Task.sleep(2 * 1_000_000_000) // Wait for 3 seconds

                // Perform deletion on the main thread
                DispatchQueue.main.async {
                    self.deleteItem(indexSet: IndexSet([index]), room: room)
                }
            }
        }
    }

    func deleteRoom(room: String) {
        roomLists.removeValue(forKey: room)
    }
    
    func saveItems() {
        let allItems = roomLists.values.flatMap { $0 }
        if let encodedData = try? JSONEncoder().encode(allItems) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
