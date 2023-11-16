//
//  NavigationLazyView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/16.
//

import SwiftUI

/**
 Push 로 화면전환시 이동할 화면을 항상 init 하게 됨.
 중간에 LazyView 를 만들어서 미리 init 되는 부분 방지
 */

// 뷰 별로 데이터 전달은 어떻게하남..?
struct NavigationLazyView<T: View>: View {
    
    let build: () -> T
    
    // @autoclosure = 중괄호 안써도 되게 설정
    init(_ build: @autoclosure @escaping () -> T) {
        print("\(T.self) - init")
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
