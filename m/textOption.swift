//
//  textOption.swift
//  patientDemo
//
//  Created by admin on 10/25/23.
//

import SwiftUI

struct textOption: View {
    @EnvironmentObject var dataModel: DataModels
    @State var name = "Abiha"
    @State var roomNumber = "222"
    @State var request : String = ""
    @State var requestSent = false
    var body: some View {
        ZStack {
            VStack {
                Text("Ask your Nurse:")
                    .frame(width: 1050, alignment: .leading)
                    .font(.title)
                    .bold()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 1050, height: 50)
                        .foregroundColor(.white)
                        .border(.black)
                    TextField("Enter What You Need", text: $request)
                        .frame(width: 1030, alignment: .leading)
                        .font(.title3)
                    //.frame(width: 300, height: 400, alignment: .leading)
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 70)
                        .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
                    Button{
                        Task {
                            await dataModel.addNewTransaction(
                                patientName: name,
                                roomNumber: roomNumber,
                                patientRequest: request,
                                DateAssigned: ""
                            )
                        }
                        requestSent = true
                    } label: {
                        Text("Request")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding(20)
            }
            
            if requestSent {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red:1, green:1, blue:1, opacity:0.5))
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame(width: 900, height: 600)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.blue, lineWidth: 2)
                        .frame(width: 900, height: 600)
                    
                    VStack {
                        //Image("blue checkmark")
                        //.scaleEffect(0.3)
                        Image("blue check")
                            .padding(50)
                        Text("Request Received")
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                            .scaleEffect(2)
                        //.padding(20)
                        NavigationLink(destination: RequestScreen()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
                                    .frame(width: 300, height: 70)
                                Text("Return")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            }
                            
                        }
                        .padding(40)
                    }
                }
            }
        }
    }
}

#Preview {
    textOption().environmentObject(DataModels())
}
