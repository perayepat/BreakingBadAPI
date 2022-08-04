//
//  TheBreakingOfTheBadApp.swift
//  TheBreakingOfTheBad
//
//  Created by IACD-013 on 2022/06/22.
//

import SwiftUI

@main
struct TheBreakingOfTheBadApp: App {
    let network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
            
        }
    }
}
