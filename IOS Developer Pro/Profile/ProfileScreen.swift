//
//  ProfileScreen.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

struct ProfileScreen: View {
    
    @EnvironmentObject private var profile: Profile
    
    var body: some View {
        VStack {
            Button {
                profile.chooseImage = true
            } label: {
                ProfileImage(image: profile.image)
            }
            Text("To change image tap on it!")
        }.sheet(isPresented: $profile.chooseImage) {
            ImagePicker(image: $profile.image)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environmentObject(Profile())
    }
}
