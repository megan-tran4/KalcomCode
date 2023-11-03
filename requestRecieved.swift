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
                .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
                .padding(100)
            Text("Request Sent")
                .font(.title)
                .bold()
            NavigationLink(destination: ContentView()){
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 250, height: 75)
                        .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
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
