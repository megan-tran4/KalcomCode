//
//  ContentView.swift
//  KalComPatientview
//
//  Created by admin on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var d:DataModels
    @State private var Name:String = ""
    @State private var RoomNumber:String = ""
    
    var body: some View {
        
        VStack{
            ZStack{
                Color.white
                    .frame(height: 100)
                HStack{
                    Image("Hospital Assets")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                    Text ("")
                        .font(.largeTitle)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/ )
                    Image("KalCom.logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    
                }
                
                
            }
            
            VStack{
                Text("Patient Name")
                    .font(.title)
                TextField("Type Your Name", text: $Name)
                Text("Room Number")
                    .font(.title)
                TextField("Enter Your Room Number", text: $RoomNumber)
                Button("Submit"){
                    Task{
                        await d.addNewPatient(patientName: Name, roomNumber: RoomNumber)
                    }
                }
                    
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .scaledToFit()
                .frame(width:100, height:100)
                Color.white
                    .scaledToFit()
                    .frame(height: 150)
                
            }
            .padding(90)
            .ignoresSafeArea()
                
                
            }
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataModels())
    }
}
