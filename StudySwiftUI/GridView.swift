//
//  GridView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/17.
//

import SwiftUI

struct GridView: View {
    
    @Binding var movie: [Movie]
    
    @State var dummy = Array(1...10).map { "오늘의 영화 순위 \($0)" }
    
    // 몇개씩 배치할지
//    private let layout = [
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120))
//    ]
    
//    private let layout = [
//        GridItem(.flexible(minimum: 100, maximum: 250)),
//        GridItem(.flexible(minimum: 100, maximum: 250)),
//        GridItem(.flexible(minimum: 100, maximum: 250))
//    ]
    
    private let layout = [
        GridItem(.flexible(),spacing: 20),
        GridItem(.flexible(),spacing: 20),
        GridItem(.flexible(),spacing: 20),
        GridItem(.flexible(),spacing: 20)
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: layout, content: {
                ForEach(dummy, id: \.self) { item in
                    ZStack {
                        Color.random()
                        Text(item)
                    }
                }
            })
            .padding()
        }
        .onAppear {
            // 뷰 나올 때 해줄 액션 ex) api call, 데이터 추가
            dummy.insert("ㄴ어ㅏㅣㄴ어ㅣㄴㅇㄴ", at: 0)
        }
        .task {  // iOS 15 비동기로 처리해야 하는 녀석이 생김
            
        }
        
    }
}

#Preview {
    GridView(movie: .constant(
        [
            Movie(name: "오잉"),
            Movie(name: "감자깡"),
            Movie(name: "고구마깡"),
            Movie(name: "김치"),
            Movie(name: "감자칩"),
            Movie(name: "삼겹살")
        ])
    )
}
