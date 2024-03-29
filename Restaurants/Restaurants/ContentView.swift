// ContentView.swift


import SwiftUI

struct ContentView: View {
    @State private var restaurants: [Restaurant] = []

    //Color array for coloring text based on the restaurant's colorIndex.
    private let colors: [Color] = [.black, .red, .orange, .yellow, .green, .blue, .indigo, .purple]

    var body: some View {
        NavigationView {
            List {
                ForEach($restaurants) { $restaurant in

                    NavigationLink(destination: RestaurantView(restaurant: $restaurant)) {

                        //Navigation link to the detailed view for each restaurant.
                        
                        Text(restaurant.name)
                            .foregroundColor(colors[restaurant.colorIndex % colors.count])
                        //Sets the text color based on the restaurant's colorIndex.
                    }
                }
                .onDelete(perform: deleteItems) //Allows you to swipe to delete
                .onMove(perform: moveItems) //Re arrenge functionaity
            }
            .navigationBarTitle("Restaurants")
            .navigationBarItems(
                leading: EditButton(), //Adds an Edit button to go into list editing mode.
                trailing: NavigationLink(destination: AddRestaurantView(restaurants: $restaurants)) {
                    Image(systemName: "plus") //Adds a button to navigate to the view for adding new restaurants.
                }
            )
        }
    }

    //Function for deleting restaurants
    func deleteItems(at offsets: IndexSet) {
        restaurants.remove(atOffsets: offsets)
    }

    //Function for reordering restaurants in the list.
    func moveItems(from source: IndexSet, to destination: Int) {
        restaurants.move(fromOffsets: source, toOffset: destination)
    }
}

