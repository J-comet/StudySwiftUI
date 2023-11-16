//
//  Extension+Color.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/16.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
