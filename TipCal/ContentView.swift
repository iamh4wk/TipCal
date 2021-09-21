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

struct Tips {
    let t1:Int = 5
    let t2:Int = 10
    let t3:Int = 15
    let t4:Int = 20
}

struct ContentView: View {
    @State private var theBill = ""
    @State private var showTipButtons = false
    @State private var showNewBill = false
    @State private var selectedTip = 0
    
    private func CalculateTip() -> Double{
        
        return 0.0
    }
    
    
    var body: some View {
        ZStack {
            //Background color
            Color.black
                .ignoresSafeArea()
                .opacity(0.1)
            
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
                
                if showTipButtons {
                    VStack {
                        HStack {
                            Button(action: {
                                showNewBill = true
                            }, label: {
                                ZStack {
                                    Image("tipButtonBG")
                                    Text(String(Tips().t1)+"%")
                                        .fontWeight(.semibold)
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                ZStack {
                                    Image("tipButtonBG")
                                    Text(String(Tips().t2)+"%")
                                        .fontWeight(.semibold)
                                }
                            })
                        }
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                ZStack {
                                    Image("tipButtonBG")
                                    Text(String(Tips().t3)+"%")
                                        .fontWeight(.semibold)
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                ZStack {
                                    Image("tipButtonBG")
                                    Text(String(Tips().t4)+"%")
                                        .fontWeight(.semibold)
                                }
                            })
                        }
                    }
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                }
                
                
                //
                //
                //
                if(showNewBill){
                    ZStack(alignment: .center) {
                        Color.blue
                        VStack{
                            Spacer()
                            Text("+ $10.00").fontWeight(.heavy)
                            Spacer()
                            Divider()
                                .frame(height:1)
                                .background(Color.white)
                                .opacity(0.5)
                            Spacer()
                            Text("$53.98").fontWeight(.heavy)
                            Spacer()
                        }
                    }
                    .cornerRadius(15.0).padding()
                    .shadow(radius: 4)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                }
            }
        }.onTapGesture {
            hideKeyboard()
            
            if(theBill != ""){
                showTipButtons = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
