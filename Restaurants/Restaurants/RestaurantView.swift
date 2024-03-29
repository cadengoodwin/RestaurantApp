// RestaurantView.swift

import SwiftUI

struct RestaurantView: View {
    @Binding var restaurant: Restaurant
    private let colors: [Color] = [.black, .red, .orange, .yellow, .green, .blue, .indigo, .purple]
    //You can pick all different colors or just black
    
    var body: some View {
        VStack(spacing: 20) { //Adds some spacing between the elements
            Text(restaurant.name)
                .font(.system(size: 24, weight: .bold)) //Make title larger than the rest and in bold for distinction
                .foregroundColor(colors[restaurant.colorIndex % colors.count])
            

            //Extra Feature: Rating system
            Text(restaurant.description)
                .font(.system(size: 16, weight: .regular, design: .default)).italic() //Makes description smaller and italic
                .foregroundColor(colors[restaurant.colorIndex % colors.count])
            
            //Display star rating
            HStack {
                Text("Rating:")
                StarRatingView(rating: .constant(restaurant.rating))
                    .disabled(true) //Make it display-only
            }
            
            
            
            Button("Change Color") {
                restaurant.colorIndex += 1
            }
            .foregroundColor(.white) //Button text color
            .padding(.vertical, 8) //Reduce vertical padding to make button smaller
            .padding(.horizontal, 20) //Adjust horizontal padding for text
            .background(Color.black) //Button bg color
            .clipShape(Capsule()) // Button shape
            .font(.system(size: 14)) // Reduces font size of the button
            
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

