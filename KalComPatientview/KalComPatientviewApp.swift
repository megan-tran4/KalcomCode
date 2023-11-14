//
//  KalComPatientviewApp.swift
//  KalComPatientview
//
//  Created by admin on 10/25/23.
//

import SwiftUI
import Firebase

@main
struct KalComPatientviewApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(DataModels())
        }
    }
}

