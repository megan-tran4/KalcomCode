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
            NavigationLink(destination: pendingRequests()) {
                Text("Requests")
                    .frame(width: 300, height: 20, alignment: .trailing)
            }
            Text("Hey, \(patient)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .scaleEffect(x: 1.5, y: 1.5)
                .bold()
                .padding(10)
            VStack {
                HStack {
                    //bathroom button
                    ZStack {
                        if bathroom{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                        else{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
                        }
                        Button(action: bathroomRequest){
                            Label("bathroom", systemImage: "toilet")
                                .scaleEffect(x: 2, y: 2)
                                .labelStyle(.iconOnly)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                    //pill button
                    ZStack {
                        if medication{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                        else{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
                        }
                        Button(action: medRequest){
                            Label("medication", systemImage: "pills")
                                .scaleEffect(x: 2, y: 2)
                                .labelStyle(.iconOnly)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                }
                HStack {
                    // water button
                    ZStack {
                        if water{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                        else{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
                        }
                        Button(action: waterRequest){
                            Label("water", systemImage: "waterbottle")
                                .scaleEffect(x: 2, y: 2)
                                .labelStyle(.iconOnly)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                    // food button
                    ZStack {
                        if food{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                        else{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
                        }
                        Button(action: foodRequest){
                            Label("food", systemImage: "fork.knife")
                                .scaleEffect(x: 2, y: 2)
                                .labelStyle(.iconOnly)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                }
                HStack {
                    // cleaning button
                    ZStack {
                        if cleaning{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                        else{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
                        }
                        Button(action: cleaningRequest){
                            Label("cleaning", systemImage: "paintbrush")
                                .scaleEffect(x: 2, y: 2)
                                .labelStyle(.iconOnly)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                    //text nav link
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
                        NavigationLink(destination: textOption()){
                            Label("text request", systemImage: "ellipsis.circle")
                                .scaleEffect(x: 2, y: 2)
                                .labelStyle(.iconOnly)
                                .foregroundColor(.white)
                        }
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
                                .frame(width: 250, height: 75)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Text("Request")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 250, height: 75)
                                .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
                            Text("Request")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                }


            }
        }
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


struct buttons: View {
    //var change: String
    @State var click: Bool = false
    @State var chosen: Color = .white
    var request: String
    var icon: String
    var body: some View {
        ZStack {
            if click{
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
            else{
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(red: 119/255, green: 190/255, blue: 248/255))
            }
            Button(action: actionRequest){
                Label(request, systemImage: icon)
                    .scaleEffect(x: 2, y: 2)
                    .labelStyle(.iconOnly)
                    .foregroundColor(.white)
            }
        }
        
    }
    func actionRequest() {
        click = !click
    }
}


