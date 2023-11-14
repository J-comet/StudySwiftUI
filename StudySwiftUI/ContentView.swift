//
//  ContentView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/13.
//

import SwiftUI


/**
 SwiftUI = struct로 한 이유
 - font, background 등 추가할 때 마다 View 를 새로운 뷰를 매번 Return 하는데 리소스 관리측면 때문에
 구조체를 이용
 */

// Generic : 사용할 때 타입을 구체적으로 지정
//         : 생성한 당시에는 어떤 타입인지 모르고, 사용할 때 구체적인 타입을 정의

// some : Opaque type - 불투명타입 (swift 5.1) 역제네릭 타입
//      : 어떤 타입인지 이미 알고 있지만 너무 복잡해서 사용할 때 숨김

// 1. modifier
// 2. 뷰가 매번 반환
// 3. modifier 순서도 때떄로 중요

//

struct ContentView: View {
    
    var title: String {
        return "오잉"
    }
    
    // 타입이 불투명해서 some View 로 타입을 미리 선언
    var body: some View {
        // 데이터스트림처럼 순서대로 적용되기 때문에
        // background 다음 padding 을 하면 색을 넣은 후 padding 이 들어가서 배경이 안넒어짐
        VStack {
            Text("욥욥욥욥욥")
                .font(.system(size: 22, weight: .bold, design: .monospaced))
                .background(Color.orange)
                .padding()
                .background(Color.blue)
            //            .foregroundColor(.white)  // iOS 17 이후 deprecated
                .foregroundStyle(Color.red)
            .border(.green, width: 10)
            
            Text("욥욥욥욥욥 222")
                .font(.system(size: 22, weight: .bold, design: .monospaced))
                .background(Color.orange)
                .padding()
                .background(Color.blue)
            //            .foregroundColor(.white)  // iOS 17 이후 deprecated
                .foregroundStyle(Color.red)
                .border(.green, width: 10)
                .clipShape(.circle)
        }
        
        //        Button("버튼버튼") {
        //            let value = type(of: self.body)
        //            print(value)
        //        }
        //        .foregroundStyle(.gray)
        //        .background(.yellow)
    }
}

#Preview {
    ContentView()
}
