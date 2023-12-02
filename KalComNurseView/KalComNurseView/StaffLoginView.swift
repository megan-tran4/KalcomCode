//
//  StaffLoginView.swift
//  KalComNurseView
//
//  Created by admin on 11/28/23.
//

import SwiftUI

struct StaffLoginView: View {
    @EnvironmentObject var d: StaffDataModels
    @State private var staffname: String = ""
    @State private var mediID: String = ""
    
    // Computed property to check if the text fields are not empty
    var isSubmitButtonEnabled: Bool {
        return !staffname.isEmpty && !mediID.isEmpty
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color.white
                    .frame(height: 100)
                HStack {
                    Image("Hospital Assets")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                    Text ("")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Image("KalCom.logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                }
            }
            
            VStack {
                Text("Full Name")
                    .font(.title)
                TextField("Type Your Name", text: $staffname)
                Text("Enter Staff ID")
                    .font(.title)
                SecureField("Enter Your Medical ID", text: $mediID)
                Button("Submit") {
                    Task {
                        print("Submitting: \(staffname), \(mediID)")
                        await d.stafflogin(staffName: staffname, mediID: mediID)
                    }
                }
                .font(.title)
                .scaledToFit()
                .frame(width: 100, height: 100)
                .disabled(!isSubmitButtonEnabled) // Disables submit button when fields are mpty
                    
                    Color.white
                        .scaledToFit()
                        .frame(height: 150)
                }
                    .padding(90)
                    .ignoresSafeArea()
            }
        //sets timestamp for patient
        if let timestamp = d.timestamp {
            Text("Timestamp: \(timestamp.dateValue())")
                .foregroundColor(.gray)
                .font(.footnote)
        }
    
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            StaffLoginView().environmentObject(StaffDataModels())
        }
    }
}
