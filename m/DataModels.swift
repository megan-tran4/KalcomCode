//
//  DataModels.swift
//  patientDemo
//
//  Created by admin on 11/25/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class DataModels:ObservableObject{
    
    func addNewTransaction(patientName:String, roomNumber: String, patientRequest: String, DateAssigned: String) async{
                
        let db = Firestore.firestore()
        
        let currentTimeStamp = Timestamp()

        
        //var _:[String:Any] = [:]
        do{
            //Patient name
            let newTransactionInfo: [String: Any] = [
                "PatientName":patientName,
                "RoomNumber": roomNumber,
                "PatientRequest": patientRequest,
                "DateAssigned": currentTimeStamp
            ]
            
            //making a random ID for users
            let transactionRef = db.collection("Transactions").document()
            
            try await transactionRef.setData(newTransactionInfo)
                print("Transaction added successfully!")

        } catch {
            print("Error adding transaction:", error.localizedDescription)
        }
        
    }
    
    /*
    private func updateFirestoreDocument(_ transaction: Transaction, inRoom roomNumber: String){
        let db = Firestore.firestore()
        
        let transactionCollection = db.collection("Transaction").document()
        
        transactionCollection
            .whereField("PatientRequest", isEqualTo: document.patientRequest)
            .whereField("RoomNumber", isEqualTo: roomNumber)
            .getDocuments { (querySnapshot?, error) in
                if let error = error {
                    print("Error updating documents: \(error)")
                } else {
                    for documents in querySnapshot!.documents {
                        let timestamp = FieldValue.serverTimestamp()
                        document.reference.updateData(["DateAssigned": timestamp])
                        
                    }
                }
            }


    }*/
    
}

/*
 db.collection("Transactions").document().updateData([
     "DateSent": FieldValue.serverTimestamp(),
 ])
 */
