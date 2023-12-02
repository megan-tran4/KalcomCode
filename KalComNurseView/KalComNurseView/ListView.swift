//
//  ListView.swift
//  KalComNurseView
//
//  Created by admin on 11/22/23.
//
import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var isEditMode = false

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(listViewModel.roomLists.keys.sorted(), id: \.self) { room in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            if isEditMode {
                                Button(action: {
                                    // Delete the room when the delete button is tapped
                                    listViewModel.deleteRoom(room: room)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .font(.system(size: 20))
                                }
                            }
                            Text("Room \(room)")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 10)
                        }

                        ForEach(listViewModel.roomLists[room] ?? [], id: \.id) { item in
                            HStack {
                                Button(action: {
                                    // Toggle completion status
                                    listViewModel.updateItem(item: item, room: room)
                                }) {
                                    Image(systemName: item.isCompleted ? "checkmark" : "exclamationmark.2")
                                        .foregroundColor(item.isCompleted ? .green : (item.title == "EMERGENCY" ? .white : .primary))
                                        .font(.system(size: 20))
                                }

                                Text(item.title)
                                    .font(.system(size: 25))
                                    .foregroundColor(item.title == "EMERGENCY" ? .white : .primary)
                                    .bold()
                                    .padding(.horizontal, 10)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(item.title == "EMERGENCY" ? Color.red.opacity(1) : Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                .onDelete(perform: deleteRoom) // Enable swipe-to-delete when in edit mode
            }
            .navigationTitle("Patient List")
            .navigationBarItems(
                leading: editButton,
                trailing: NavigationLink("Add", destination: AddView())
            )
        }
    }

    var editButton: some View {
        Button(action: {
            isEditMode.toggle()
        }) {
            Text(isEditMode ? "Done" : "Edit")
        }
    }

    func deleteRoom(at offsets: IndexSet) {
        // Delete the room when swiped in edit mode
        if let index = offsets.first {
            let keys = listViewModel.roomLists.keys.sorted()
            if keys.indices.contains(index) {
                let roomToDelete = keys[index]
                // Remove the room from the list
                listViewModel.roomLists.removeValue(forKey: roomToDelete)
            }
        }
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ListView().environmentObject(ListViewModel())
            }
        }
    }
}
