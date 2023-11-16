//
//  Extension+View.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/13.
//

import SwiftUI

extension View {
    
    func asPointBorderText() -> some View {
        modifier(PointBorderText())
    }
    
    func asThumbImageFrame() -> some View {
        modifier(ThumbImageFrame())
    }
    
}
