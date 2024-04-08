//
//  Landmark.swift
//  Landmarks
//
//  Created by UTKARSH on 17/11/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Hashable, Codable, Identifiable {
    var id: Int
        var name: String
        var park: String
        var state: String
        var description: String
        var isFavorite: Bool
        var isFeatured: Bool
    
    var category: Category
        enum Category: String, CaseIterable, Codable {
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"
        }
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    //+ "_feature"
    var featureImage: Image? {
            isFeatured ? Image(imageName ) : nil
        }
    
    private var coordinates: Coordinates
       var locationCoordinate: CLLocationCoordinate2D {
           CLLocationCoordinate2D(
               latitude: coordinates.latitude,
               longitude: coordinates.longitude)
       }


       struct Coordinates: Hashable, Codable {
           var latitude: Double
           var longitude: Double
       }
    
}
