//
//  ContentView.swift
//  patientDemo
//
//  Created by admin on 10/25/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var patient = "Abiha"
    @State var bathroom = false
    @State var medication = false
    @State var water = false
    @State var food = false
    @State var cleaning = false
    @State var other = false
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    NavigationLink(destination: pendingRequests()) {
                        Text("Requests")
                            .font(.title3)
                            .frame(width: 850, height: 70, alignment: .trailing)
                    }
                    Text("Hey, \(patient)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .scaleEffect(x: 1.5, y: 1.5)
                        .bold()
                        .padding(20)
                }
            }
            VStack {
                HStack {
                    //bathroom button
                    VStack{
                        if bathroom{
                            Button(action: bathroomRequest){
                                Image("toilet-blue 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        else{
                            Button(action: bathroomRequest){
                                Image("toilet-grey 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        Text("assist restroom")
                            .font(.title2)
                    }
                    .padding(20)
                    //pill button
                    VStack {
                        if medication{
                            Button(action: medRequest){
                                Image("medicine-blue 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        else{
                            Button(action: medRequest){
                                Image("medicine-grey 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        Text("need medicine")
                            .font(.title2)
                    }
                    .padding(20)
                    //water button
                    VStack {
                        if water{
                            Button(action: waterRequest){
                                Image("water-blue 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                            
                        }
                        else{
                            Button(action: waterRequest){
                                Image("water-grey 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        Text("need water")
                            .font(.title2)
                    }
                    .padding(20)
                }
                HStack {
                    //food button
                    VStack {
                        if food{
                            Button(action: foodRequest){
                                Image("food-blue 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        else{
                            Button(action: foodRequest){
                                Image("food-grey 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        Text("need food")
                            .font(.title2)
                    }
                    .padding(20)
                    // cleaning button
                    VStack {
                        if cleaning{
                            Button(action: cleaningRequest){
                                Image("trash-blue 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        else{
                            Button(action: cleaningRequest){
                                Image("trash-grey 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height:140)
                            }
                        }
                        Text("need cleaning")
                            .font(.title2)
                    }
                    .padding(20)
                    //text nav link
                    VStack{
                        NavigationLink(destination: textOption()){
                            Image("nurse-grey 180x180")
                                .scaleEffect(0.8)
                                .frame(width: 140, height: 140)
                        }
                        Text("ask a nurse")
                            .font(.title2)
                    }
                    .padding(20)
                }
                //request sending button
                NavigationLink {
                    if (bathroom || medication || water || food || cleaning){
                            requestRecieved()
                    }
                } label: {
                    if (bathroom || medication || water || food || cleaning){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 300, height: 70)
                                .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
                            Text("Request")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding(20)
                    }
                    else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 300, height: 70)
                                .foregroundColor(Color(red: 141/255, green: 203/255, blue: 239/255))
                            Text("Request")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding(20)
                    }
                }
            }
            ZStack{
                Color.gray
                    .frame(height:70)
                NavigationLink(destination: requestRecieved()){
                    Image("emergency-red 180x180")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
            }
        }
        .ignoresSafeArea()
    }
    func bathroomRequest() {
        bathroom = !bathroom
    }
    func medRequest() {
        medication = !medication
    }
    func waterRequest() {
        water = !water
    }
    func foodRequest() {
        food = !food
    }
    func cleaningRequest() {
        cleaning = !cleaning
    }
    func otherRequest() {
        other = !other
    }
}

#Preview {
    ContentView()
}
