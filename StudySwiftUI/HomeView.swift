//
//  HomeView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 40) {
                Text("타이틀")
                    .frame(maxWidth: .infinity)
            
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                        AsyncImageView()
                            .frame(width: 100, height: 100)
                    }
                }
            }.background(.cyan)
        }
    }
}

#Preview {
    HomeView()
}
