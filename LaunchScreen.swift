//
//  LoadingView.swift
//  KalComPatientview
//
//  Created by admin on 10/25/23.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
            Image("KalCom.logo")
            .resizable()
            .scaledToFit()
            .frame(width:300, height:200)
        .padding()
    }
}

#Preview {
    LaunchScreenView()
}
