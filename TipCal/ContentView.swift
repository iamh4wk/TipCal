//
//  ContentView.swift
//  TipCal
//
//  Created by Hawk on 9/14/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //Background color
            Color.black
                .ignoresSafeArea()
                .opacity(0.2)
            
            //Logo
            Image("appLogo")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
