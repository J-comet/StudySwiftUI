//
//  TamagochiView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/14.
//

import SwiftUI

struct User {
    var nickname = "고래밥"
    
    var introduce: String {
        //        set {
        //            nickname = "오잉"
        //        }
        mutating get {
            nickname = "오잉"
            return "안녕하세요 \(nickname) 입니다"
        }
    }
    
    mutating func changeNickname() {
        nickname = "칙촉"
    }
}

/**
 앱에서 UI 는 Data 에 의존해서 자신의 상태를 결정하게 된다.
 */
struct TamagochiView: View {
    
    // @State. Source of Truth.
    // 오로지 자기 자신의 View 에 대한 상태를 저장하기 위한 목적.
    // 상태 프로퍼티 (State Property)
    @State private var nickname = "고래밥"
    
    @State private var waterCnt = 0
    @State private var riceCnt = 0
    
    @State private var isOn = false
    @State private var textFieldText = ""
    
    // 연산 프로퍼티에 View 들을 넣어서 만들어 주는중
    var body: some View {
        
        /**
         SwiftUI View 는 Body 를 쓰도록 하는 프로토콜을 채택하는데
         body 는 get 만 반환 가능하게 되어 있음
         따라서 mutating get 로는 해결 불가능
         @State 키워드가 SwiftUI 에 등장
         데이터가 달라질 때 렌더링.
         */
        
        Spacer()
        //        mutating get {
        VStack {
            
            TextField("입력해주세요", text: $textFieldText)
                        
            // Toggle 또한 애플에서 제공하는 하위뷰로 구성되어 있기때문에 Binding<Bool> 로 이뤄져있음.
            Toggle("스위치", isOn: $isOn)
            
            ExtractedView(title: "물방울 수", nickname: $nickname, cnt: $waterCnt)
            Button("물방울 카운트") {
//                nickname = "호잇"
                waterCnt += 1
                isOn.toggle()
            }
            .background(.link)
            .foregroundStyle(.white)
            
            ExtractedView(title: "밥알 수", nickname: $nickname, cnt: $riceCnt)
            // titleKey = String 만 넣을 수 있음
            
            // action, label => Custom 을 하는데 용이
            Button(action: {
                print("텍스트에 padding 넣으면 클릭영역도 커짐")
                riceCnt += 1
            }, label: {
                Text("밥알 갯수")
                    .padding(30)    // 모든 클릭영역 가능
                
            })
            .padding(20)  // 클릭영역은 커지지 않음
            .background(.orange)
            
        }.padding(20)
        //        }
        
        Spacer()
        
    }
}

#Preview {
    TamagochiView()
}

// @Binding, Derived Value (파생된 데이터)
struct ExtractedView: View {
    
    /**
     상위뷰와 하위뷰의 데이터 동기화를 위해 Binding 키워드 사용
     상위뷰의 @State 프로퍼티를 받음
     */
    
    let title: String
    @Binding var nickname: String
//    @State var cnt: Int   // 상위 뷰의 @State 값 전달 받지 못하게됨.
    @Binding var cnt: Int
    
    /**
     @State 로 설정해버리면 상위뷰의 @State 프로퍼티를 받을 수 없음
     하위뷰와 상위뷰의 프로퍼티 값을 동기화하기 위해선 @Binding 키워드 사용 필요
     */
    
    var body: some View {
        HStack {
            Text("\(nickname)의 \(title) = \(cnt)")
                .padding(20)
                .background(.black)
                .foregroundStyle(.white)
            .font(.title)
            
            Button(action: {
                /**
                 해당 위치에서도 cnt 증가 시켜주고 싶을 때
                 */
                cnt += 1
            }, label: {
                Text("제2의 버튼")
            })
        }
    }
}
