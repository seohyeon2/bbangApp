//
//  HomeView.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/02.
//

import SwiftUI

struct HomeView: View {
    @State var current = "추천"
    @Namespace var animation
    var body: some View {
        NavigationView {
            VStack {
                NotificationBar()
                    .padding(10)
                
                HStack() {
                    TopTapBarButton(current: $current, title: "추천", animation: animation)
                    TopTapBarButton(current: $current, title: "유저", animation: animation)
                    TopTapBarButton(current: $current, title: "비건", animation: animation)
                    TopTapBarButton(current: $current, title: "예약구매", animation: animation)
                    TopTapBarButton(current: $current, title: "기획전", animation: animation)
                }
                
                TopTapBarContent(current: current)
            }
        }
    }
}
