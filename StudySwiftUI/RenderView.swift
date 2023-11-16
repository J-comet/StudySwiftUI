//
//  RenderView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/13.
//

import SwiftUI

struct RenderView: View {
    /**
     @Environment
     - 시스템에서 정의된 값을 감지하고 뷰를 업데이트 할 수 있음
     - 어떤 뷰에서도 같은 값을 가짐
     
     @State
     - 해당하는 뷰에서만 값을 가짐
     */
    
    // 화면 전환 관련 프로퍼티
    // presentationMode = deprecated
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    // 라이트모드 or 다크모드 설정
    @Environment(\.colorScheme) var colorScheme
    
    init(age: Int = 10) {
        self.age = age
        print("\(self) - init")
    }
    
    var hue: some View {
        Text("Hue: \(Int.random(in: 1...100))")
    }
    
    // 변수를 View 에 넣어서 사용하고 싶을 때
    @State var age = 10
    
    /**
     SwiftUI
     - 렌더링 기준은 어떻게 될까?
     - CustomModifier, CustomView 구성하는 법 중요!
     
     */
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    RoundedRectangle(cornerSize: .init(width: 30, height: 30))
                        .fill(
                            
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow, Color.blue]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
                            
                            
                        )
                    RoundedRectangle(cornerSize: .init(width: 30, height: 30))
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [.yellow, .red]), center: .bottom, startRadius: 20, endRadius: 100)
                        )
                    
                    RoundedRectangle(cornerSize: .init(width: 30, height: 30))
                        .fill(
                            AngularGradient.init(gradient: Gradient(colors: [Color.red, Color.blue]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
                    
                }.frame(width: .infinity, height: 100)
                
                /**
                 NavigationVIew (iOS 15)
                 NavigationStack (iOS 16+)
                 */
                // NavigationBar - Push 방식 [ NavigationView + NavigationLink ]
                NavigationLink("Push") {
                    MenuView()
                }
                .padding(20)
                
                hue
                JackView()  // 버튼을 눌렀을 떄 해당 뷰만 다시 안그려지고 있음.
                Text("Bran: \(age), \(Int.random(in: 1...100))")
                Text("Koko: \(Int.random(in: 1...100))")
                
                Button(colorScheme == .dark ? "다크모드" : "라이트모드") {
                    // dismiss 코드
//                    presentationMode.wrappedValue.dismiss()
                    dismiss.callAsFunction()
                }
                .padding()
                .background(colorScheme == .dark ? .white : .blue)
                .foregroundStyle(colorScheme == .dark ? .brown : .yellow)
            }
            .navigationTitle("Wow")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RenderView()
}

struct JackView: View {
    var body: some View {
        Text("Jack: \(Int.random(in: 1...100))")
            .font(.title3)
    }
}
