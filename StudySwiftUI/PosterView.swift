//
//  PosterView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/15.
//

import SwiftUI

/**
 ScrollView 사용할 때 LazyVStack 를 자주 사용
 LazyVStack vs VStack
 - 최적화 차이
 
 AsyncImage ( iOS 15 )
 */

struct PosterView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            
            // LazyVStack 은 스크롤할 때 보이는 View에 대해서만 데이터를 새로 로드
            // VStack 은 처음에 모든 데이터를 로드
            
            LazyVStack {
                ForEach(0..<50) { item in
                    // frame 을 지정해둬야 보이는 영역의 ImageView 만 이미지 로드 함
                    AsyncImageView()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            print("클릭")
                            isPresented.toggle()
                        }
//                    Text("안녕하세요요요요요요요요요abcdefg \(item)")
//                        .font(.largeTitle)
//                        .lineLimit(1)
                }
            }
            //            .frame(maxWidth: .infinity)  // 꽉채우기
            .background(.link)
            .sheet(isPresented: $isPresented, content: {
                MenuView()
            })
        }
        .background(.gray)
        //        .contentMargins(100, for: .scrollContent)
    }
}

struct AsyncImageView: View {
    
    let url = URL(string: "https://picsum.photos/200")!
    
    var body: some View {
        //        AsyncImage(url: url)
        //            .aspectRatio(contentMode: .fill)
        
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                    )
            case .failure(_):
                Image(systemName: "person")
            @unknown default:
                Image(systemName: "person")
            }
        }
        
        
        
        
        //        /**
        //         - 에러상황일 때 대응할 수 없음
        //         - 에러일 때 placeholder 에서 계속 동작됨.
        //         */
        //        AsyncImage(url: url) { image in
        //            image
        //                .frame(width: 100, height: 100)
        //                .scaledToFit()
        //                .clipShape(RoundedRectangle(cornerSize: .init(width: 20, height: 20)))
        ////                .cornerRadius(20)
        //        } placeholder: {
        //            ProgressView()
        ////            Image(.turtle)
        //        }
        
    }
}

#Preview {
    PosterView()
//    AsyncImageView()
}
