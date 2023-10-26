//
//  ContentView.swift
//  KalComPatientview
//
//  Created by admin on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack{
            ZStack{
                Color.white
                    .frame(height: 100)
                Image("KalCom.logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
            }
            
            VStack{
                Text("Patient Name")
                    .font(.title)
                    .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                TextField("Type Your Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Text("Patient ID")
                    .font(.title)
                TextField("Enter Your Patient ID", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Button("Submit"){
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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

#Preview {
    ContentView()
}
