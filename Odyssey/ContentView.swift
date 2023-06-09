//
//  ContentView.swift
//  Odyssey
//
//  Created by Eugene Demenko on 11.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: MonobankAPI
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.945, blue: 0.929)
                .ignoresSafeArea()
            VStack {
                          header
                          Spacer()
                          if model.currency.isEmpty {
                              ProgressView()
                          } else {
                              ScrollView {
                                  ForEach(model.currency, id: \.currencyCodeA) { currency in
                                      CardView(currency: currency)
                                  }
                              }
                          }
                Spacer()
            }
        }
    
        
    }
}

var header: some View {
    Text("Odyssey")
        .fontWeight(.bold)
        .font(.largeTitle)
        .foregroundColor(Color(red: 0.8, green: 0.45, blue: 0.38))
        .font(.custom("GFSNeohellenic-Bold", size: 50))
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(model: currency)
//    }
//}
