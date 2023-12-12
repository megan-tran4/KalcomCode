//
//  RequestScreen.swift
//  patientDemo
//
//  Created by admin on 12/7/23.
//

import SwiftUI

struct RequestScreen: View {
    @EnvironmentObject var dataModel: DataModels
    @ObservedObject var viewModel = TransactionViewModel()
    
    @State private var name: String = "Carlos"
    @State private var roomNumber: String = "222"
    
    @State var reqTimer = 3
    @State var countDownTimer = 5
    @State var reqTimerRunning = true
    @State var emergTimerRunning = true
    @State var offscreen = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var offset = CGSize.zero
    
    @State var requestSent = false
    
    //button clicks
    @State var bathroom = false
    @State var medication = false
    @State var water = false
    @State var food = false
    @State var cleaning = false
    
    //emergency
    @State var emergency = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    //to see rquests you alr made
                    HStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        NavigationLink(destination: requestDisplay(room: roomNumber)) {
                            Text("Requests")
                                .font(.title2)
                                //.frame(width: 850, height: 70, alignment: .trailing)
                        }
                        Spacer()
                    }
                    //to see name on top
                    Text("Hey, \(name)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .scaleEffect(x: 1.5, y: 1.5)
                        .bold()
                        .padding(20)
                    Spacer()
                    //.padding(20)
                    Spacer()
                    
                    //buttons
                    HStack {
                        Spacer()
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
                        Spacer()
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
                        Spacer()
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
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
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
                        Spacer()
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
                        Spacer()
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
                        Spacer()
                    }
                    Spacer()
                    
                    //request sending button
                    if (bathroom || medication || water || food || cleaning){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 300, height: 70)
                                .foregroundColor(Color(red:74/255, green:154/255, blue:212/255))
                            Button{
                                if bathroom {
                                    Task {
                                        await dataModel.addNewTransaction(
                                            patientName: name,
                                            roomNumber: roomNumber,
                                            patientRequest: "Bathroom",
                                            DateAssigned: ""
                                        )
                                    }
                                    bathroom = false
                                } ; if medication {
                                    Task {
                                        await dataModel.addNewTransaction(
                                            patientName: name,
                                            roomNumber: roomNumber,
                                            patientRequest: "Medication", DateAssigned: ""
                                        )
                                    }
                                    medication = false
                                } ; if water {
                                    Task {
                                        await dataModel.addNewTransaction(
                                            patientName: name,
                                            roomNumber: roomNumber,
                                            patientRequest: "Water",
                                            DateAssigned: ""
                                        )
                                    }
                                    water = false
                                } ; if food {
                                    Task {
                                        await dataModel.addNewTransaction(
                                            patientName: name,
                                            roomNumber: roomNumber,
                                            patientRequest: "Food",
                                            DateAssigned: ""
                                        )
                                    }
                                    food = false
                                } ; if cleaning {
                                    Task {
                                        await dataModel.addNewTransaction(
                                            patientName: name,
                                            roomNumber: roomNumber,
                                            patientRequest: "Cleaning",
                                            DateAssigned: ""
                                        )
                                    }
                                    cleaning = false
                                }
                                requestSent = true
                                
                            } label: {
                                Text("Request")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
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
                        Spacer()
                    }
                    Spacer()
                    
                    //emergency button
                    ZStack{
                        Color.black
                            .frame(width: 1370, height:100)
                            Button{
                                Task {
                                    await dataModel.addNewTransaction(
                                        patientName: name,
                                        roomNumber: roomNumber,
                                        patientRequest: "Emergency",
                                        DateAssigned: ""
                                    )
                                }
                                emergency = true
                            }label:{
                                Image("emergency-red 180x180")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }
                    }
                    .offset(y:20)
                }
                //requestDisplay(room: roomNumber)
                    //.offset(x:100)
                //if theres a request and timer is on
                if requestSent && reqTimerRunning {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red:1, green:1, blue:1, opacity:0.5))
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .frame(width: 900, height: 600)
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(width: 900, height: 600)
                            
                        VStack {
                            //Image("blue checkmark")
                            //.scaleEffect(0.3)
                            Image("blue check")
                                .padding(50)
                            Text("Request Received")
                                .foregroundColor(.black)
                                .bold()
                                .font(.title)
                                .scaleEffect(2)
                        }
                    }
                    .onReceive(timer){ _ in
                        if reqTimer > 0 && reqTimerRunning {
                            reqTimer = reqTimer - 1
                        } else if reqTimer == 0  {
                            requestSent = false
                        }
                    }
                }
                
                //if the emergency button is pressed
                if emergency {
                        //if NOT offscreen and timer is running
                        if !offscreen && emergTimerRunning {
                            ZStack {
                                Color.white
                                    .ignoresSafeArea()
                                ZStack{
                                    Color.red
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
                                        Spacer()
                                        Text("swipe anywhere to cancel")
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .scaleEffect(1.2)
                                        Spacer()
                                        Text("Time Remaining: \(countDownTimer) seconds")
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .bold()
                                            .scaleEffect(1.2)
                                            .padding(20)
                                            .onReceive(timer){ _ in
                                                if countDownTimer > 0 && emergTimerRunning {
                                                    countDownTimer = countDownTimer - 1
                                                } else if countDownTimer == 0 || offscreen == true {
                                                    emergTimerRunning = false
                                                }
                                            }
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                }
                                .ignoresSafeArea()
                                
                                // Step 4 Design the gestures required for your app
                                //
                                .offset(x: offset.width, y: offset.height * 0)     // Allows you to move the card
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
                            }
                            
                        }
                        // NOT offscreen and timer is NOT running
                        else if !offscreen && !emergTimerRunning {
                            ZStack{
                                Color.red
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
                                    Spacer()
                                    NavigationLink(destination: RequestScreen()){
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
                                }
                            }
                            .ignoresSafeArea()
                        }
                        // is offscreen
                        else if offscreen {
                            ZStack {
                                Color.white
                                VStack{
                                    Image("red checkmark")
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .padding(20)
                                    Text("Emergency cancelled")
                                        .font(.title)
                                        .scaleEffect(1.5)
                                        .bold()
                                        .padding(20)
                                    NavigationLink(destination: RequestScreen()){
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
                                }
                            }
                        }// ifs
                }//if emergency
            }//zstack for req and emerg
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

#Preview {
    RequestScreen().environmentObject(DataModels())
}
