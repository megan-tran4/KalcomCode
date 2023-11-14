//
//  DataModels.swift
//  KalComPatientview
//
//  Created by admin on 11/7/23.
//

import Foundation
import Firebase
import FirebaseFirestore



class DataModels:ObservableObject{
    
    func addNewPatient(patientName:String, roomNumber: String) async{
        
        let db = Firestore.firestore()
        
        var _:[String:Any] = [:]
        do{
            //Patient name
            let newPatientInfo = [
                "PatientName":patientName,
                "RoomNumber": roomNumber
                
            ]
            
            //making a random ID for users
            let patientRef = db.collection("Patient").document()
            
            try await patientRef.setData(newPatientInfo)
                print("Patient added successfully!")

        } catch {
            print("Error adding patient:", error.localizedDescription)
        }
        
        
    }
}
