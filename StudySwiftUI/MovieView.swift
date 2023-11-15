//
//  MovieView.swift
//  StudySwiftUI
//
//  Created by 장혜성 on 2023/11/14.
//

import SwiftUI

struct MovieView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        
        ZStack {
            //            Color.cyan
            Image(.turtle)
            //            Image(systemName: "star")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            //                .scaledToFit()
            //                .aspectRatio(contentMode: .fill)
            
            Text("ㅋㅋㅋ")
            
            VStack {
                
                Spacer()
                Image(.turtle)
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .border(.green, width: 10)
                    .clipShape(Circle())
                
                VStack {
                    Button(action: {
                        isPresented = true
                    }, label: {
                        Text("SHOW")
                    })
                    Spacer()
                    HStack {
                        
                        Circle().frame(width: 100, height: 100)
                        Rectangle().frame(width: 100, height: 100)
                        RoundedRectangle(cornerSize: .init(width: 20, height: 20)).frame(width: 100, height: 100)
    //                    Image(.turtle)
    //                        .resizable()
    //                        .frame(width: 100, height: 100, alignment: .center)
    //                        .border(.link, width: 10)
    //                        .clipShape(Rectangle())
    //                    Image(.turtle)
    //                        .resizable()
    //                        .frame(width: 100, height: 100, alignment: .center)
    //                        .border(.green, width: 10)
    //                        .clipShape(Circle())
    //                    Image(.turtle)
    //                        .resizable()
    //                        .frame(width: 100, height: 100, alignment: .center)
    //                        .border(.red, width: 10)
    //                        .clipShape(
    //                            RoundedRectangle(cornerSize: .init(width: 30, height: 30))
    //                        )
                    }
                }
            }
        }
        // fullScreen 방식
//        .fullScreenCover(isPresented: $isPresented, content: {
//            TamagochiView()
//        })
        // sheet 방식
        .sheet(isPresented: $isPresented, content: {
            TamagochiView()
        })
    }
}

#Preview {
    MovieView()
}
