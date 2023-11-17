//
//  ChartView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/17.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    let movie: [Movie]
    
    @Environment(\.colorScheme) var color
    
    // @ViewBuilder 
    // - body 를 제외하는 모든 뷰에 ViewBuilder 가 다 사용중
    // 조건문을 통해서 다른 뷰를 return 하고 싶을 경우 명세해주어야함.
    @ViewBuilder
    var chartTitle: some View {
        if color == .dark {
            Text("다크 차트")
        } else {
            Text("라이트 차트")
        }
    }
    
    var body: some View {
        VStack {
            chartTitle
            // iOS 16+
            Chart(movie, id: \.self) { item in
//                BarMark(
//                RectangleMark(
//                LineMark(
                AreaMark(
                    x: .value("장르", item.name),
                    y: .value("관람횟수", item.count)
                )
                .foregroundStyle(Color.random())
            }
            .frame(height: 300)
        }
        .padding()
    }
}

#Preview {
    ChartView(movie: [
        Movie(name: "오잉"),
        Movie(name: "감자깡"),
        Movie(name: "고구마깡"),
        Movie(name: "김치"),
        Movie(name: "감자칩"),
        Movie(name: "삼겹살")
    ])
}
