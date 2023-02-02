//
//  HomeViewModel.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/02.
//

import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentBannerIndex = 0
    @Published private(set) var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    private var bannerService = BannerService(state: Exhibition())
    
    func getCurrentBannerIndex(_ bannerImagesCount: Int) {
        currentBannerIndex = currentBannerIndex < bannerImagesCount - 1 ? currentBannerIndex + 1 : 0
    }
    
    func cancelTimer() {
        timer.upstream.connect().cancel()
    }
    
    func restartTimer() {
        cancelTimer()
        timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    }
}
