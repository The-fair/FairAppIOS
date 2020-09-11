//
//  RatingStar.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 9/8/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI


// helper function rating view
struct RatingStar: View {
    
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
//                    .onTapGesture {
//                        self.rating = number
//                    }
            }
        }
    }
    
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}


