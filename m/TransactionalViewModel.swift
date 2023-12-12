//
//  TransactionViewModel.swift
//  Simple Data Pull
//
//  Created by admin on 12/4/23.
//


import Foundation
import Firebase
import FirebaseFirestore

class TransactionViewModel: ObservableObject {
    @Published var transactionsByRoom: [String: [Transaction]] = [:]
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        let transactionsCollection = db.collection("Transactions")
        
        transactionsCollection.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                var transactionsByRoom: [String: [Transaction]] = [:]
                
                for document in querySnapshot!.documents {
                    let patientRequest = document["PatientRequest"] as? String ?? ""
                    let roomNumber = document["RoomNumber"] as? String ?? ""
                    
                    // Check if the document has a "DateCompleted" field
                    if document["DateCompleted"] == nil {
                        let transaction = Transaction(patientRequest: patientRequest, roomNumber: roomNumber)
                        
                        if var roomTransactions = transactionsByRoom[roomNumber] {
                            roomTransactions.append(transaction)
                            transactionsByRoom[roomNumber] = roomTransactions
                        } else {
                            transactionsByRoom[roomNumber] = [transaction]
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.transactionsByRoom = transactionsByRoom
                }
            }
        }
    }
    
    
    func deleteTransaction(_ transaction: Transaction, inRoom roomNumber: String) {
        if var roomTransactions = transactionsByRoom[roomNumber],
           let index = roomTransactions.firstIndex(of: transaction) {
            
            // Remove the selected transaction locally
            roomTransactions.remove(at: index)
            transactionsByRoom[roomNumber] = roomTransactions
            
            // Update the Firestore document with the "Date Completed" field
            updateFirestoreDocument(transaction, inRoom: roomNumber)
        }
    }
    
    private func updateFirestoreDocument(_ transaction: Transaction, inRoom roomNumber: String) {
        let db = Firestore.firestore()
        let transactionsCollection = db.collection("Transactions")

        // Find documents to update based on transaction details
        transactionsCollection
            .whereField("PatientRequest", isEqualTo: transaction.patientRequest)
            .whereField("RoomNumber", isEqualTo: roomNumber)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error updating documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        // Check if the document already has a "DateCompleted" field
                        if document.data()["DateCompleted"] == nil {
                            // Add the "Date Completed" field with a timestamp value
                            let timestamp = FieldValue.serverTimestamp()
                            document.reference.updateData(["DateCompleted": timestamp])
                        }
                    }
                }
            }
    }

}
