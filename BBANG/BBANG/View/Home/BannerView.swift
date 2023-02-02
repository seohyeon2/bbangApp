//
//  BannerView.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/03.
//

import SwiftUI

struct BannerView: View {
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
