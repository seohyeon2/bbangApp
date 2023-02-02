//
//  ProductListView.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/03.
//

import SwiftUI

struct ProductListView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("New Product")
                        .foregroundColor(.black)
                        .font(.system(.headline))
                    Text("이달의 신상 빵")
                        .foregroundColor(.gray)
                        .font(.system(.footnote))
                }
                Spacer()
            }
            
            ScrollView(.horizontal) {
                VStack(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                            .opacity(0.2)
                            .frame(width: 150, height: 150)
                        // TODO: 신상 빵 데이터 추가하기 (사진, 빵이름, 브랜드이름, 가격)
                        Image("circleButtonEvent")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .overlay (
                                Button(action: {
                                    
                                }, label: {
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 15, height: 3)
                                        .foregroundColor(.black)
                                })
                                .padding(.leading, 110)
                                .padding(.top, 100)
                            )
                    }
                    
                    Text("도넛1")
                        .foregroundColor(.black)
                        .font(.system(.footnote))
                        .bold()
                    Text("던킨도넛츠")
                        .foregroundColor(.black)
                        .font(.system(.footnote))
                    Text("1,000원")
                        .foregroundColor(.black)
                        .font(.system(.footnote))
                        .bold()
                        .padding(.top, 2)
                }
            }
        }
    }
}
