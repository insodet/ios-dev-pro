//
//  ConttentView.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.tabSection) {
            DashboardScreen()
                .tag(0)
                .tabItem {
                    Label("Dashboard", systemImage: "star")
                }
            FoodSсreen()
                .tag(1)
                .tabItem {
                    Label("Foods", systemImage: "fork.knife.circle.fill")
                }
            ProfileScreen()
                .tag(2)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }.animation(.easeInOut, value: router.tabSection)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
