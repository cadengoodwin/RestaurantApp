// AddRestaurantView.swift

import SwiftUI

struct AddRestaurantView: View {
    @Binding var restaurants: [Restaurant]
    @State private var name = ""
    @State private var description = ""
    @State private var rating = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Add Restaurant")
                    .font(.largeTitle)
                    .padding()

                Form {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    StarRatingView(rating: $rating) //Add the star rating view

                    Button("Add") { //Adds to the list of restaurants
                        if !name.isEmpty && !description.isEmpty { //Making sure the values aren't empty
                            let newRestaurant = Restaurant(name: name, description: description, rating: rating)
                            restaurants.append(newRestaurant)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    //UI button style and padding
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

