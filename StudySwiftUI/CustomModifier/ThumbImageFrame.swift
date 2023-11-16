//
//  ThumbImageFrame.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/16.
//

import SwiftUI

struct ThumbImageFrame: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
    }
    
}
