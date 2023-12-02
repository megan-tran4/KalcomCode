//
//  StaffDataModels.swift
//  KalComNurseView
//
//  Created by admin on 11/28/23.
//

import Foundation
import Firebase
import FirebaseFirestore



class StaffDataModels: ObservableObject {
    @Published var timestamp: Timestamp?

    func stafflogin(staffName: String, mediID: String) async {
        let db = Firestore.firestore()

        do {
            // Patient information
            let newStaffInfo: [String: Any] = [
                "staffName": staffName,
                "mediID": mediID,
                "timestamp": FieldValue.serverTimestamp()
            ]

            // Adding staff to Firestore
            let staffRef = try await db.collection("MediStaff").addDocument(data: newStaffInfo)
            print("Staff added successfully with ID: \(staffRef.documentID)")

            // Sets the timestamp
            timestamp = Timestamp()
        } catch {
            print("Error adding Staff: \(error.localizedDescription)")
        }
    }
}
