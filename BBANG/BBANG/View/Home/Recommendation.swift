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
           Banner()
        }
    }
}

struct Banner: View {
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    var bannerImages = [
        Image("기획전"),
        Image("검색"),
        Image("예약구매"),
        Image("포인트적립")
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
