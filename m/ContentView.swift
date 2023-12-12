//
//  ContentView.swift
//  patientDemo
//
//  Created by admin on 10/25/23.
//

import SwiftUI
import UIKit
import FirebaseCore
import FirebaseFirestore


struct ContentView: View {
    var body: some View {
        NavigationStack{
            Spacer()
            VStack {
                    Image("kalcom 1024")
                            .resizable()
                            .frame(width: 200, height: 200)
                    Text(" Select the best description.")
                        .font(.title)
                            .bold()
                        
                NavigationLink(destination: NurseSignIn()) {
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
                            .font(.title)
                            .bold()
                            .padding()
                        NavigationLink(destination: RequestScreen()) {
                            Text("Are you a Patient?")
                                .font(.title2)
                                .foregroundColor(.blue)
                                .padding()
                                .bold()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(8)
                        }
                        .padding()
                    }
            Spacer()
        }
    }
}

#Preview {
    ContentView().environmentObject(DataModels())
}
