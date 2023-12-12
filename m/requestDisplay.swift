//
//  requestDisplay.swift
//  patientDemo
//
//  Created by admin on 11/17/23.
//

import SwiftUI

struct requestDisplay: View {
    @ObservedObject var viewModel = TransactionViewModel()
    var room = ""

    var body: some View {
        //NavigationView {
            if viewModel.transactionsByRoom.isEmpty {
                VStack{
                    Image("KalComLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180)
                        .padding()
                    Text("Patient List")
                        .font(.largeTitle)
                        .bold()
                    Text("No Requests for now")
                        .font(.title)
                    Spacer()}
            } else {
                List {
                    //ForEach(Array(viewModel.transactionsByRoom.keys), id: \.self) {
                        //roomNumber in
                        Section(header: Text("Room \(room)  - Pending Requests")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .bold()
                            .padding(.vertical, 2)
                        ) {
                            ForEach(viewModel.transactionsByRoom[room] ?? [], id: \.id) { transaction in
                                Text(" \(transaction.patientRequest)")
                                    .font(.system(size: 32)) // Adjust the size as needed
                                    .foregroundColor(transaction.patientRequest == "Emergency" ? .red : .black)
                                    .bold()
                                
                            }
                        }
                    //}
                }
            }
            
        //}
    }
}

#Preview {
    requestDisplay(room: "223")
}
