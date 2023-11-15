//
//  TransitionView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/15.
//

import SwiftUI

/**
 버튼을 클릭해서 화면 Dismiss / Pop
 화면 전환 시 데이터 전달
 화면 전환 시 분기 처리
 */
struct TransitionView: View {
    
    @State private var isFullScreen = false
    @State private var isSheetScreen = false
    
    var body: some View {
        
        NavigationView {
            HStack(spacing: 20) {
                Button(
                    action: {
                        isFullScreen.toggle()
                    }, label: {
                        Text("FullScreen")
                    }
                )
                .padding(16)
                .background(.link)
                .foregroundStyle(.white)
                
                Button(
                    action: {
                        isSheetScreen.toggle()
                    }, label: {
                        Text("Sheet")
                    }
                )
                .padding(16)
                .background(.orange)
                .foregroundStyle(.white)
                
                // Push 방식
                NavigationLink("Push") {
                    RenderView()
                }
                .padding(16)
                .background(.green)
                .foregroundStyle(.white)
            }
            .sheet(isPresented: $isSheetScreen, content: {
                MenuView()
            })
            .fullScreenCover(isPresented: $isFullScreen, content: {
                RenderView()
        })
            
        }
    }
}

#Preview {
    TransitionView()
}
