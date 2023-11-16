//
//  SearchView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/16.
//

import SwiftUI

struct SearchView: View {
    
    @State var randomNumber = 0
    
    init(randomNumber: Int = 0) {
        self.randomNumber = randomNumber
        print("\(self) - init")
    }
    
    var jack: some View {
        Text("Jack")
            .padding()
            .background(Color.random())
            .foregroundStyle(.white)
    }
    
    func kokoView() -> some View {
        Text("Kokojong")
            .padding()
            .background(Color.random())
            .foregroundStyle(.white)
    }
    
    var body: some View {
        /**
         구조체를 별도로 사용하지 않는 한 body 안의 모든 View 가 다시 렌더링 됨.
         */
        VStack {
            HueView()
            jack
            kokoView()
            Text("Bran \(randomNumber)")
                .padding()
                .background(Color.random())
                .foregroundStyle(.white)
            
            Button(action: {
                randomNumber = Int.random(in: 1...100)
            }, label: {
                Text("클릭")
            })
            .padding()
            .background(.link)
            .foregroundStyle(.white)
            .containerShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        }
        
    }
}

#Preview {
    SearchView()
}

/**
 View 만들 때 init 구문을 통해 확인해보며 개발진행하기
 */
struct HueView: View {
    
    /**
     init() 에서 네트워크 호출을 피해야된다.
     body 를 다시 그리지는 않지만 init() 은 계속 호출되고 있기 때문
     */
    init() {
        print("\(self) - init")
    }
    
    /**
     body 프로퍼티와 init 이 따로 동작하는 이유
     * 연산프로퍼티의 특성때문에
     - 사용될 때만 메모리에 올라감?
     */
    var body: some View {
        Text("Hue")
            .padding()
            .background(Color.random())
            .foregroundStyle(.white)
    }
}


