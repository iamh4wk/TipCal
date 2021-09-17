//
//  ContentView.swift
//  TipCal
//
//  Created by Hawk on 9/14/21.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .shadow(color: .gray,radius: 5)
            
    }
}

struct TipButton: View {
    var percent:Int = 0
    
    var body: some View{
        Button(action: {
            print("The percentage is \(percent) %")
        }, label: {
            ZStack {
                Image("tipButtonBG")
                Text(String(percent)+" %")
            }
        })
    }
}

struct TipCalculator {
    
}

struct ContentView: View {
    @State private var theBill = ""
    
    
    var body: some View {
        ZStack {
            //Background color
            Color.black
                .ignoresSafeArea()
                .opacity(0.2)
            
            VStack {
                //Logo
                Image("appLogo")
                
                //Title and Input
                Text("TIP CALCULATOR")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                
                //What was the damage TextField
                TextField("What was the damage?", text:$theBill)
                    .font(Font.system(size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .textFieldStyle(OvalTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                
                VStack {
                    HStack {
                        TipButton(percent: 5)
                        TipButton(percent: 10)
                    }
                    HStack {
                        TipButton(percent: 15)
                        TipButton(percent: 20)
                    }
                }
            }
        }.onTapGesture {
            hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
