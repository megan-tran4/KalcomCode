//
//  textOption.swift
//  patientDemo
//
//  Created by admin on 10/25/23.
//

import SwiftUI

struct textOption: View {
    @State var request : String = ""
    var body: some View {
        //Spacer()
        ZStack {
            Color(red: 119/255, green: 190/255, blue: 248/255)
            VStack {
                Text("Type your needs below:")
                    .frame(width: 320, alignment: .leading)
                    .font(.title2)
                    .bold()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 320, height: 50)
                        .foregroundColor(.white)
                        .border(.black)
                    TextField("What do you need assitance with?", text: $request)
                        .frame(width: 300, alignment: .leading)
                    //.frame(width: 300, height: 400, alignment: .leading)
                        .foregroundColor(.black)
                }
                NavigationLink(destination: requestRecieved()){
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 250, height: 75)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text("Request")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    textOption()
}
