//
//  AddView.swift
//  KalComNurseView
//
//  Created by admin on 11/22/23.
//
//
//  AddView.swift
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var roomNumberText: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Room number!", text: $roomNumberText)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.635, saturation: 0.0, brightness: 0.953))
                    .cornerRadius(7)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height: 35)
                        .frame(width: 65)
                        .background(Color.accentColor)
                        .cornerRadius(5)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Room +")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: "Bathroom Assistance", room: roomNumberText)
            presentationMode.wrappedValue.dismiss()
        }
    }


    
    func textIsAppropriate() -> Bool {
        if roomNumberText.count < 2 {
            alertTitle = "Room number must be at least 2 digits long!"
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}
