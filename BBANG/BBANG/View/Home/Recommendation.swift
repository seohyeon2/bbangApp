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
                Line()
                ProductList()
                Line()
                RecommendedBrandList()
                Advertising(imageName: "banner1")
                ProductList()
                Info()
            }
        }
    }
}

struct Banner: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var bannerImages = [
        Image("banner1"),
        Image("banner2"),
        Image("banner3"),
        Image("banner4")
    ]
    var body: some View {
        GeometryReader { proxy in
            TabView(selection: $homeViewModel.currentBannerIndex) {
                ForEach(bannerImages.indices, id: \.self) { index in
                    NavigationLink {
                        if homeViewModel.currentBannerIndex == 3 {
                            SavedPointView()
                        }
                    } label: {
                        bannerImages[index]
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay (
                HStack(spacing: 0) {
                    ForEach(0..<4) { index in
                        if homeViewModel.currentBannerIndex == index {
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
            
            .onReceive(homeViewModel.timer) { _ in
                withAnimation {
                    homeViewModel.getCurrentBannerIndex(bannerImages.count)
                }
            }
            .onAppear {
                self.homeViewModel.restartTimer()
            }
            .onDisappear {
                homeViewModel.cancelTimer()
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

struct Line: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(height: 1)
            .opacity(0.2)
            .padding()
    }
}

struct ProductList: View {
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

// TODO: 브랜드 데이터 추가하기
struct RecommendedBrandList: View {
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
