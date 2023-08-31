//
//  DashboardScreen.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

struct DashboardScreen: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var foodList: FoodListViewModel
    
    var body: some View {
        if let navigatableFood = foodList.foods.randomElement() {
            Button("Navigate to: \(navigatableFood.name)") {
                router.navigate(toFood: navigatableFood.id)
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
