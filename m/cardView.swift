//
//  CardView.swift
//  SwiftUI Swipe App Example
//
//  Created by Bill Skrzypczak on 11/4/23.
//

import SwiftUI

struct CardView: View {
    
    // Step 2 Define any variables you will need
    //
    @State var countDownTimer = 5
    @State var timerRunning = true
    @State var offscreen = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var offset = CGSize.zero // Where we drag a card and where it ends up
    //@State private var color: Color = .red // Color of the initial card
    
    
    // Step 3 Design your UI
    //
    var body: some View {
        if offscreen == false && timerRunning == true {
            ZStack{
                Rectangle()
                    .frame(width: 1370, height: 1050) // Define a frame
                    .border(.black, width: 6.0) // Put a border areound it
                    .cornerRadius(9) // Round the corners
                    .foregroundColor(.red) // Define opacity of fill color
                    .shadow(radius: 25) // Give it a nice shadow
                
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Emergency Sent") // Some text to identify what you are working with
                        .font(.largeTitle)
                        .scaleEffect(2.5)
                        .foregroundColor(.white)
                        .bold()
                        //.padding(40)
                    Spacer()
                    Text("swipe anywhere to cancel")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .scaleEffect(1.2)
                        //.padding(20)
                    Spacer()
                    Text("Time Remaining: \(countDownTimer) seconds")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .scaleEffect(1.2)
                        //.padding(20)
                        .onReceive(timer){ _ in
                            if countDownTimer > 0 && timerRunning {
                                countDownTimer = countDownTimer - 1
                            } else if countDownTimer == 0 || offscreen == true {
                                timerRunning = false
                            }
                        }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    //Spacer()
                    
                }
            }
            
            
            // Step 4 Design the gestures required for your app
            //
            .offset(x: offset.width, y: offset.height * 0)     // Allows you to move the card
            .rotationEffect(.degrees(Double(0))) // Use rotation to exaggerate movement
            .gesture(
                DragGesture()
                    .onChanged { gesture in                      // Do something when you swipe
                        offset = gesture.translation
                    } .onEnded { _ in                           // Do something when you stop swiping
                        withAnimation {
                            swipeCard(width: offset.width)      // Use swipeCard function to swipe the card
                        }
                        
                    }
                
            )
        } else if timerRunning == false {
            ZStack{
                Rectangle()
                    .frame(width: 1370, height: 1050)
                    .foregroundColor(.red)
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Emergency Sent")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .scaleEffect(2.5)
                        .bold()
                    Spacer()
                    Text("Your nurse will be on their way shortly")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .scaleEffect(1.2)
                        //.padding(30)
                    Spacer()
                    NavigationLink(destination: ContentView()){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 250, height: 75)
                                .foregroundColor(.white)
                            Text("Return")
                                .font(.title)
                                .bold()
                                .foregroundColor(.red)
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    //Spacer()
                }
            }
            .ignoresSafeArea()
        } else if offscreen == true {
            VStack{
                Spacer()
                Spacer()
                Image("red checkmark")
                    .resizable()
                    .frame(width: 400, height: 400)
                Spacer()
                Text("Emergency cancelled")
                    .font(.title)
                    .scaleEffect(2)
                    .bold()
                Spacer()
                NavigationLink(destination: ContentView()){
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 250, height: 75)
                            .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
                        Text("Return")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Spacer()
            }
        }
    }
    
    // Step 5 Design a function to handle the "Swipe"
    //
    func swipeCard(width: CGFloat) {
        switch width {
        case -2000...(-150):                                 // Swipe all the way left
            print("Emergency cancelled")                      // Document that the card has been removed
            offscreen = true
            offset = CGSize(width: -4000, height: 0)
        case 150...2000:                                     // Swipe all the way right
            print("Emergency cancelled")                        // Document that the card has been added
            offscreen = true
            offset = CGSize(width: 4000, height: 0)
        default:                                            // Reset the card
            offset = .zero
        }
    }
    
    }

    // Populate the view with the first card
    //


