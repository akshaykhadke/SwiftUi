//
//  ProfileHost.swift
//  Landmarks
//
//  Created by UTKARSH on 23/11/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                
                if editMode?.wrappedValue == .active {
                                   Button("Cancel", role: .cancel) {
                                       draftProfile = modelData.profile
                                       editMode?.animation().wrappedValue = .inactive
                                   }
                               }
                            Spacer()
                            EditButton()
                        }
            
            if editMode?.wrappedValue == .inactive {
                            ProfileSummary(profile: modelData.profile)
                        } else {
                            ProfileEditor(profile: $draftProfile).onAppear{
                                draftProfile = modelData.profile
                            }.onDisappear{
                                modelData.profile = draftProfile
                            }
                        }
               }
               .padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
