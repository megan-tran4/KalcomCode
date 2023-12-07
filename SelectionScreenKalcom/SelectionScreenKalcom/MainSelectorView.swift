//
//  MainSelectorView.swift
//  SelectionScreenKalcom
//
//  Created by admin on 12/6/23.
//

import SwiftUI

struct MainSelectorView: View {
    var body: some View {
        VStack {
            Image("KalComLogo")
                .resizable()
                .frame(width: 200, height: 190)
            Text(" Select the best description.")
                .frame(width: 350)
                .bold()
            
            Button(action: {
                // Handle action for "Medical Staff" button
                print("Medical Staff button tapped")
            }) {
                Text("Are you Medical Staff?")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .bold()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            Text("OR")
                .font(.title3)
                .bold()
                .padding()
            Button(action: {
                // Handle action for "Patient" button
                print("Patient button tapped")
            }) {
                Text("Are you a Patient?")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
                    .bold()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(8)
            }
            .padding()
            Spacer()
        }
    }
}

struct MainSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MainSelectorView()
    }
}
