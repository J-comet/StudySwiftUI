//
//  PointBorderText.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/13.
//

import SwiftUI

// custom modifier
struct PointBorderText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .foregroundStyle(.white)
            .background(.purple)
            .clipShape(.capsule)  // iOS 17 이상
    }
    
}
