//
//  ContentView.swift
//  Odyssey
//
//  Created by Eugene Demenko on 11.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.945, blue: 0.929)
                .ignoresSafeArea()
            VStack{
                header
                
              VStack(alignment: .leading) {
                    Text("scrum.title")
                                 .font(.headline)
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .cornerRadius(20)
                        .foregroundColor(.green)
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .cornerRadius(20)
                        .foregroundColor(.blue)
                }
                    
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

var CardView: some View{
   
          VStack(alignment: .leading) {
              Text("hello")
                  .accessibilityAddTraits(.isHeader)
                  .font(.headline)
              Spacer()
              HStack {
                  Label("hello", systemImage: "person.3")
                      .accessibilityLabel(" attendees")
                  Spacer()
                  Label("hello", systemImage: "clock")
                      .accessibilityLabel("minute meeting")
              }
              .font(.caption)
          }
          .padding()
          .foregroundColor(.green)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
