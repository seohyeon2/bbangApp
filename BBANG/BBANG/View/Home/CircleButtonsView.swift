//
//  CircleButtonsView.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/03.
//

import SwiftUI

struct CircleButtonsView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Recommended Brand")
                        .foregroundColor(.black)
                        .font(.system(.headline))
                    Text("추천 브랜드")
                        .foregroundColor(.gray)
                        .font(.system(.footnote))
                }
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack {
                    VStack {
                        Button {
                            
                        } label: {
                            Image("circleButtonPoint")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.black)
                        .clipShape(Circle())
                        
                        Text("브랜드1")
                            .foregroundColor(.black)
                            .font(.system(.footnote))
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 30)
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Image("circleButtonPoint")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.black)
                        .clipShape(Circle())
                        
                        Text("브랜드2")
                            .foregroundColor(.black)
                            .font(.system(.footnote))
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 30)
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Image("circleButtonPoint")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.black)
                        .clipShape(Circle())
                        
                        Text("브랜드3")
                            .foregroundColor(.black)
                            .font(.system(.footnote))
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 30)
                }
            }
        }
    }
}
