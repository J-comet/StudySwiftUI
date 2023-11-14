//
//  CardView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/13.
//

import SwiftUI

struct CardView: View {
    let image: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: image)
                .background(.yellow)
            Text(text)
                .background(.link)
                .underline()        // text 아래 라인 추가
                .strikethrough()    // text 중간에 라인 추가
        }
        .padding(8)
        .background(.red)
    }
}

#Preview {
    CardView(image: "star", text: "테스트")
}
