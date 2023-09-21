//
//  ImageExtensions.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/20/23.
//

import Foundation
import SwiftUI

extension Image {
    func roundedImage() -> some View {
        self
            .resizable()
            .frame(width: 120, height: 120)
            .foregroundColor(.white)
            .background(Color.gray)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
    }
}
