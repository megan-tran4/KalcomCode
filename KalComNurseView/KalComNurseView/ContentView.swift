//
//  ContentView.swift
//  KalComNurseView
//
//  Created by admin on 11/22/23.
//

import SwiftUI

struct ContentView: View {

        @StateObject var listViewModel: ListViewModel =     ListViewModel()

    var body: some View {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
#Preview {
    ContentView()
}
