//StarRatingView.swift

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int

    var body: some View {
        HStack {
            //Loop to create 5 star icons
            ForEach(1...5, id: \.self) { number in
                Image(systemName: "star.fill") //Use filled star image
                    .foregroundColor(number <= rating ? .yellow : .gray) //Color stars based on the current rating
                    .onTapGesture {
                        rating = number //Set the rating to the selected star number on tap
                    }
            }
        }
    }
}

