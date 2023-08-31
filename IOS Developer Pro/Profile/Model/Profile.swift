//
//  Profile.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

class Profile: ObservableObject {
    @Published var chooseImage = false
    @Published var image: Image? = nil
}

