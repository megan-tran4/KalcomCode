//
//  ListRowView.swift
//  KalComNurseView
//
//  Created by admin on 11/22/23.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    let item: ItemModel
    let room: String // Add this line
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "exclamationmark.circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.title)
            
            Spacer()
            
            Button(action: {
                // Toggle completion status
                listViewModel.updateItem(item: item, room: room) // Add room parameter
            }) {
                Text(item.isCompleted ? "Undo" : "Complete")
            }
            
            Button(action: {
                // Delete the item
                listViewModel.deleteItem(indexSet: IndexSet([0]), room: room) // Modify as needed
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}
