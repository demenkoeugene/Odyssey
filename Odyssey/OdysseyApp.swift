//
//  OdysseyApp.swift
//  Odyssey
//
//  Created by Eugene Demenko on 11.03.2023.
//

import SwiftUI

@main

struct OdysseyApp: App {
    var model = MonobankAPI()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
}



