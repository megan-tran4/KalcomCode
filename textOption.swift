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
            Color(Color(red: 141/255, green: 203/255, blue: 239/255))
            VStack {
                Text("Type your needs below:")
                    .frame(width: 1050, alignment: .leading)
                    .font(.title)
                    .bold()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 1050, height: 50)
                        .foregroundColor(.white)
                        .border(.black)
                    TextField("What do you need assitance with?", text: $request)
                        .frame(width: 1030, alignment: .leading)
                        .foregroundColor(.black)
                }
                NavigationLink(destination: requestRecieved()){
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 300, height: 70)
                            .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
                        Text("Request")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding(20)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    textOption()
}
