//
//  StartView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/15.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Text("홈")
                    Image(systemName: "house.fill")
                }
            MenuView()
                .tabItem {
                    Text("메뉴")
                    Image(systemName: "star")
                }
            RenderView()
                .tabItem {
                    Text("프로필")
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    StartView()
}
