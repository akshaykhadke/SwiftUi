//
//  LandmarkList.swift
//  Landmarks
//
//  Created by UTKARSH on 17/11/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks : [Landmark]{
        modelData.landmarks.filter { landmark in
            
            (!showFavoritesOnly || landmark.isFavorite)
            //( landmark.isFavorite == true)
            
        }
    }
    
    var body: some View {
        
        NavigationSplitView{
            List{
                
                Toggle(isOn: $showFavoritesOnly ) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
               
            }.navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
