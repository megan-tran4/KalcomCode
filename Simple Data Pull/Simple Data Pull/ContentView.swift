//
//  ContentView.swift
//  Simple Data Pull
//
//  Created by admin on 12/4/23.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TransactionViewModel()
    
    var body: some View {
        NavigationView {
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
                    ForEach(Array(viewModel.transactionsByRoom.keys), id: \.self) { roomNumber in
                        Section(header:
                                    Text("Room \(roomNumber)")
                            .font(.title3)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.vertical, 2)
                        ) {
                            ForEach(viewModel.transactionsByRoom[roomNumber] ?? [], id: \.id) { transaction in
                                Text(" \(transaction.patientRequest)")
                                    .font(.title2) // Adjust the size as needed
                                    .foregroundColor(transaction.patientRequest == "Emergency" ? .red : .black)
                                    .bold()
                                    .onTapGesture {
                                        // Handle tap action (e.g., show details or delete)
                                        viewModel.deleteTransaction(transaction, inRoom: roomNumber)
                                    }
                                
                            }
                        }
                    }
                }
                .navigationBarTitle("Patient List", displayMode: .large)
            }
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
