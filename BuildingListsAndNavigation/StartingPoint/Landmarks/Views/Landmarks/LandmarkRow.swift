//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by UTKARSH on 17/11/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark : Landmark
    
    var body: some View {
        HStack{
            landmark.image.resizable().frame(width: 50,height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite == true{
                Image(systemName: "star.fill").foregroundStyle(.yellow)
            }
        }
    }
}

#Preview ("Turtle Rock"){
    Group{
        LandmarkRow(landmark: ModelData().landmarks[0])
        LandmarkRow(landmark: ModelData().landmarks[1])
    }
}

#Preview ("Silver Salmon"){
    LandmarkRow(landmark: ModelData().landmarks[1])
}
