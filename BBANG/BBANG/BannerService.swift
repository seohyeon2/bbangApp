//
//  BannerState.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/02.
//

protocol BannerState {
    func moveView()
}

class BannerService {
    private var state: BannerState
    
    init(state: BannerState) {
        self.state = state
    }
    
    func move() {
        state.moveView()
    }
    
    func changeState(_ state: BannerState) {
        self.state = state
    }
}

class Exhibition: BannerState {
    func moveView() {
        // 기획전 탭으로 이동
    }
}

class PreOrderPurchase: BannerState {
    func moveView() {
        // 예약구매 탭으로 이동
    }
}

class Search: BannerState {
    func moveView() {
        // 검색 탭으로 이동
    }
}

class SavedPoint: BannerState {
    func moveView() {
        // 포인트 적립으로 이동
    }
}
