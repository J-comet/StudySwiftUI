//
//  AsyncImageView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/16.
//

import SwiftUI

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
    AsyncImageView()
}
