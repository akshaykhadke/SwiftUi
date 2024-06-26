//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by UTKARSH on 22/11/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
                    .padding(-60)
                    .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
