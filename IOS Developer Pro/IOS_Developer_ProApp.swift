//
//  IOS_Developer_ProApp.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

@main
struct IOS_Developer_ProApp: App {
    
    @StateObject var router = Router()
    @StateObject var foodsList = FoodListViewModel()
    @StateObject var profile = Profile()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(foodsList)
                .environmentObject(profile)
        }
    }
}
