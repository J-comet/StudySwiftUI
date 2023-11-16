//
//  RenderView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/13.
//

import SwiftUI

struct RenderView: View {
    
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
                
                Button("액션") {
                    age = Int.random(in: 1...100)
                }
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
