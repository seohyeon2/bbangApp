//
//  Recommendation.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/02.
//

import SwiftUI

struct Recommendation: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Banner()
                CircleMenu()
            }
        }
    }
}

struct Banner: View {
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    var bannerImages = [
        Image("banner1"),
        Image("banner2"),
        Image("banner3"),
        Image("banner4")
    ]
    var body: some View {
        GeometryReader { proxy in
            TabView(selection: $currentIndex) {
                ForEach(bannerImages.indices, id: \.self) { index in
                    bannerImages[index]
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay (
                HStack(spacing: 0) {
                    ForEach(0..<4) { index in
                        if currentIndex == index {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 2)
                        } else {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 2)
                                .opacity(0.3)
                        }
                    }
                }
                .padding(.bottom, 7)
                ,alignment: .bottom
            )
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = currentIndex < bannerImages.count ? currentIndex + 1 : 0
                }
            }
        }
        .frame(height: 300)
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
                Button {
                    
                } label: {
                    Image("circleButtonPoint")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                }
                .frame(width: 60, height: 60)
                .background(Color.yellow)
                .clipShape(Circle())
                
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
