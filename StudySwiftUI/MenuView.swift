//
//  MenuView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/13.
//

import SwiftUI

/**
 해당 View 에서만 사용이 필요하다면 프로퍼티로 관리해볼 수도 있음.
 */

struct MenuView: View {
    
    // MenuView 에서만 활용할 때
    var cardProperty: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "person")
                .background(.yellow)
            Text("인원")
                .background(.link)
        }
        .padding(8)
        .background(.red)
    }
    
    var body: some View {
        
//        VStack {
//            Spacer()    // 남은 공간 꽉차게 해줌
//            HStack(spacing: 20) {
//                CardView(image: "star", text: "01")
//                CardView(image: "star.fill", text: "02")
//                CardView(image: "star", text: "03")
//            }
//            .background(.yellow)
//            Spacer()
//            Spacer()
//        }
        
        VStack {
            HStack(spacing: 20) {
                CardView(image: "star", text: "01")
                CardView(image: "star.fill", text: "02")
                CardView(image: "star", text: "03")
                cardProperty
            }
            
            List {
                Section("1번 제목") {
                    Text("보안과 인증")
                        .modifier(PointBorderText())
                    
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    Text("내 신용점수")
                        .asPointBorderText()  // extension 으로 사용 pointBorder 
                    ColorPicker(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)
                    Text("진행 중인 이벤트")
                }
                
                Section("2번 제목") {
                    Text("보안과 인증")
                    Text("내 신용점수")
                    Text("진행 중인 이벤트")
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    MenuView()
}


