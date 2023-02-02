//
//  RecommendationTapView.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/02.
//

import SwiftUI

struct RecommendationTapView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                BannerView()
                CircleMenu()
                LineView()
                ProductListView()
                LineView()
                CircleButtonsView()
                Advertising(imageName: "banner1")
                ProductListView()
                Info()
            }
        }
    }
}

struct CircleMenu: View {
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var isImage = true

    var body: some View {
        HStack() {
            VStack {
                Button {
                    
                } label: {
                    Text("User")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .frame(width: 60, height: 60)
                .background(Color.black)
                .clipShape(Circle())
                
                Text("유저 추천")
                    .foregroundColor(.black)
                    .font(.system(.footnote))
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 10)
            
            VStack {
                Button {
                    
                } label: {
                    Text("Vegan")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .frame(width: 60, height: 60)
                .background(Color.black)
                .clipShape(Circle())
                
                Text("비건 추천")
                    .foregroundColor(.black)
                    .font(.system(.footnote))
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 10)
            
            VStack {
                Button {
                    
                } label: {
                    Text("Bakery")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .frame(width: 60, height: 60)
                .background(Color.black)
                .clipShape(Circle())
                
                Text("빵집 추천")
                    .foregroundColor(.black)
                    .font(.system(.footnote))
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 10)
        }
        
        HStack() {
            VStack {
                Button {
                    
                } label: {
                    GeometryReader { proxy in
                        if isImage {
                            Image("circleButtonEvent")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .padding([.top,.bottom], 10)
                                .padding(.leading, 8)
                        } else {
                            Text("Event")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding([.top,.bottom], 20)
                                .padding(.leading, 7)
                        }
                    }
                    .onReceive(timer) { _ in
                        withAnimation {
                            isImage.toggle()
                        }
                    }
                }
                .frame(width: 60, height: 60)
                .background(Color.gray)
                .clipShape(Circle())
                
                Text("이벤트 응모")
                    .foregroundColor(.black)
                    .font(.system(.footnote))
            }
            .padding([.leading, .trailing], 20)
            
            VStack {
                
                NavigationLink {
                    SavedPointView()
                } label: {
                    ZStack {
                        Image("circleButtonPoint")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                    }
                    .frame(width: 60, height: 60)
                    .background(Color.yellow)
                    .clipShape(Circle())
                }
                
                Text("포인트 적립")
                    .foregroundColor(.black)
                    .font(.system(.footnote))
            }
            .padding([.leading, .trailing], 20)
            
            VStack {
                Button {
                    
                } label: {
                    Image("circleButtonBrand")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 60, height: 60)
                .background(Color.blue)
                .clipShape(Circle())
                
                Text("브랜드 확인")
                    .foregroundColor(.black)
                    .font(.system(.footnote))
            }
            .padding([.leading, .trailing], 20)
        }
    }
}

struct Advertising: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .padding([.top, .bottom], 80)
    }
}

struct Info: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.green)
            .frame(height: 500)
            .padding(.top, 20)
    }
}
