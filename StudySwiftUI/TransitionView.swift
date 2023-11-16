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
    
    
    init(isFullScreen: Bool = false, isSheetScreen: Bool = false) {
        self.isFullScreen = isFullScreen
        self.isSheetScreen = isSheetScreen
        print("\(self) - init")
    }
    
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
                // NavigaionLink 에서는 넘어갈 화면이 미리 init 되어 있음.
                
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
