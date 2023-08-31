//
//  Router.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

class Router: ObservableObject {
    @Published var tabSection = 0
    @Published var listItem: UUID? = nil
    
    func navigate(toFood foodTag: UUID) {
        tabSection = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.listItem = foodTag
        }
    }
    
    func revertToFoodSCreen() {
        listItem = nil
    }
}

