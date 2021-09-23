//
//  TipMainView.swift
//  TipCal
//
//  Created by Hawk on 9/21/21.
//

import SwiftUI

struct TipOptions {
    let t1:Int = 5
    let t2:Int = 10
    let t3:Int = 15
    let t4:Int = 20
}

struct TipMainView: View {
    @State private var theCheck = 0         //the recieved bill
    @State private var theTip = 0.0         //the tip
    @State private var theTotalBill = 0.0   //the check plus tip
    
    private var currencyFormatter: NumberFormatter = {
            let f = NumberFormatter()
            // allow no currency symbol, extra digits, etc
            f.isLenient = true
            f.numberStyle = .currency
            return f
        }()
    
    var body: some View {
        ZStack {
            
            //
            //Background color - Bluish
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 2, endRadius: 650)
                .ignoresSafeArea()
                .opacity(0.2)
            
            VStack(alignment: .center){
                
                //
                //Logo
                ZStack {
                    Circle()
                        .fill(Color.orange)
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .stroke(Color.yellow,lineWidth: 15)
                        .frame(width:135,height:135)
                        .rotationEffect(Angle.degrees(145))
                    Text("%")
                        .font(.system(size: 80))
                        .fontWeight(.black)
                        .foregroundColor(.yellow)
                    Circle()
                        .trim(from: 0.0, to: 1)
                        .stroke(Color.white,lineWidth: 1)
                        .opacity(0.5)
                }
                .frame(height:150)
                .shadow(color: Color.orange.opacity(0.2), radius: 10.0, x: 0.0, y: 10.0)
                .shadow(color: Color.white.opacity(0.9), radius: 25.0, x: 0.0, y: -20.0)
                
                //
                //Title
                Text("TIP CALCULATOR")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.black)
                    .foregroundColor(Color.blue)
                
                //
                //Input field for the bill
                ZStack {
                    TextField("Enter the Bill",value:$theCheck,formatter:currencyFormatter,onEditingChanged: { edit in
                        if edit {
                            //
                        }
                    })
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 48.0)
                        .onSubmit {
                            print("Commit")
                        }
                        
                }
                Spacer()
                //
                // Tip Options
                ZStack{
                   // Color(.orange)
                    VStack(alignment:.center, spacing:1){
                        HStack(alignment:.center, spacing: 1){
                            Button {
                                //code
                            } label: {
                                Text("\(TipOptions().t1) %").fontWeight(.heavy).foregroundColor(.white)
                            }
                            .frame(width: 146, height: 75, alignment: .center)
                            .background(Color(.orange))
                            
                            Button {
                                //code
                            } label: {
                                Text("\(TipOptions().t2) %").fontWeight(.heavy).foregroundColor(.white)
                            }
                            .frame(width: 146, height: 75, alignment: .center)
                            .background(Color(.orange))
                        }
                        
                        HStack(alignment:.center, spacing: 1){
                            Button {
                                //code
                            } label: {
                                Text("\(TipOptions().t3) %").fontWeight(.heavy).foregroundColor(.white)
                            }
                            .frame(width: 146, height: 75, alignment: .center)
                            .background(Color(.orange))
                            
                            Button {
                                //code
                            } label: {
                                Text("\(TipOptions().t4) %").fontWeight(.heavy).foregroundColor(.white)
                            }
                            .frame(width: 146, height: 75, alignment: .center)
                            .background(Color(.orange))
                        }
                    }
                }
                .cornerRadius(15.0)
                .padding([.top], 25.0)
                .shadow(color: Color.orange.opacity(0.4), radius: 25.0, x: 0.0, y: 20.0)
                .font(.system(size: 30))
                
                Spacer()
                
                //
                //
                ZStack(alignment: .center) {
                    //Color("TotalMenuColor")
                    LinearGradient(gradient: Gradient(colors: [Color("TotalMenuColor"),Color("TotalMenuColorDarker")]), startPoint: .zero, endPoint: .bottomLeading)
                          
                    VStack{
                        Spacer()
                        Text("+ 10.00").fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        Text("10% GRADITUDE").fontWeight(.thin)
                            .foregroundColor(Color.white)
                            .font(.system(size: 20))
                        Spacer()
                        Divider()
                            .frame(height:1)
                            .background(Color.white)
                            .opacity(0.5)
                        Spacer()
                        Text("$53.98").fontWeight(.heavy)
                            .foregroundColor(Color("TotalColor"))
                            .shadow(color: Color.orange.opacity(0.4), radius: 25.0, x: 0.0, y: 20.0)
                        Spacer()
                    }
                }
                .cornerRadius(15.0)
                .padding([.top, .leading, .trailing], 47.0)
                .shadow(color: Color.blue.opacity(0.6), radius: 25.0, x: 0.0, y: 40.0)
                .shadow(color: Color.white.opacity(0.8), radius: 12.0, x: 0.0, y: 10.0)
                .font(.system(size: 50))
            }
        }
    }
}

struct TipMainView_Previews: PreviewProvider {
    static var previews: some View {
        TipMainView()
    }
}
