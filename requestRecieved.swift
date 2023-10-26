//
//  requestRecieved.swift
//  patientDemo
//
//  Created by admin on 10/25/23.
//

import SwiftUI

struct requestRecieved: View {
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle")
                .scaleEffect(x: 10, y: 10)
                .foregroundColor(.blue)
                .padding(100)
            Text("Request Sent")
                .font(.title)
                .bold()
            NavigationLink(destination: ContentView()){
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 250, height: 75)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("Return")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    requestRecieved()
}
