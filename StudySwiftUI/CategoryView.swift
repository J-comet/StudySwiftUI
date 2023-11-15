//
//  CategoryView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/15.
//

import SwiftUI

/**
 ForEach
 - ..<
  - Swift KeyPath =  \.
 - id: KeyPath => item
 - Hasable
 */

// Identifiable 프로토콜 => id 프로퍼티를 무조건 사용하게 강제
struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    
    let category = [
        Category(name: "상자", count: 11),
        Category(name: "마술", count: 12),
        Category(name: "신문", count: 13),
        Category(name: "과자", count: 14),
        Category(name: "삼겹살", count: 15),
        Category(name: "항정살", count: 16),
        Category(name: "갈비살", count: 17),
        Category(name: "갈비살", count: 11),
        Category(name: "갈비살", count: 1),
        Category(name: "갈비살", count: 2),
        Category(name: "갈비살", count: 3)
    ]
    
    var body: some View {
        // id = 어떤 값을 고유한값(Hashable) 으로 사용할지 결정
        ForEach(category, id: \.id) { item in
            Text("\(item.name) 욥, 갯수 \(item.count)")
                .font(.largeTitle)
        }
        
//        ForEach(category, id: \.self) { item in
//            Text("\(item.name) 욥, 갯수 \(item.count)")
//                .font(.largeTitle)
//        }
    }
}

#Preview {
    CategoryView()
}
