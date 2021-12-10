//
//  Item.swift
//  e-commerce
//
//  Created by Mohamed Zaher on 10/12/2021.
//

import SwiftUI

// Item Model And Sample Data...

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var price: String
    var rating: String
    var image: String
}

var items = [
    
    Item(title: "Casual Uniform", subTitle: "Most Rated uniform", price: "$150", rating: "4.8", image: "first"),
    Item(title: "T-shirt Collection", subTitle: "highly recomended users", price: "$180", rating: "4.5", image: "second"),
    Item(title: "SweatPants", subTitle: "Extrer River SweatPants", price: "$90", rating: "4.1", image: "third"),
    Item(title: "shirt", subTitle: "Most selled", price: "$45", rating: "4.5", image: "fourth")
]
