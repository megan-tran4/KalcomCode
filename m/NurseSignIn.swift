//
//  NurseSignIn.swift
//  patientDemo
//
//  Created by admin on 12/7/23.
//

import SwiftUI

struct NurseSignIn: View {
    @State var ID = ""
    var body: some View {
        VStack{
            HStack{
                Image("kalcom 1024")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 400)
            }
            Text("Nurse ID")
                .font(.largeTitle)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 350, height: 70)
                    .foregroundColor(.gray.opacity(0.15))
                TextField("Type Your ID", text: $ID)
                    .font(.title)
                    .frame(width: 300)
            }
                //.padding(50)
                //.ignoresSafeArea()
            Spacer()
            NavigationLink(destination: NurseView()){
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 70)
                    Text("Submit")
                        .font(.title)
                        .foregroundColor(.white)
                        
                }
            }
            Spacer()
        }
    }
}

#Preview {
    NurseSignIn()
}
