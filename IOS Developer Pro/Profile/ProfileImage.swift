//
//  ProfileImage.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

struct ProfileImage: View {
    
    let image: Image?
    
    var body: some View {
        ZStack {
            if let image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top)
            }
        }.frame(width: 200, height: 200)
        .background(Color.teal)
        .cornerRadius(100)
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(image: nil)
    }
}
