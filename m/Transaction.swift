//
//  Transaction.swift
//  Simple Data Pull
//
//  Created by admin on 12/4/23.
//
import Foundation

struct Transaction: Identifiable, Equatable {
    var id = UUID()
    let patientRequest: String
    let roomNumber: String
}
