//
//  TopBarButton.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/02.
//

import SwiftUI
struct TopBarButton: View {
    @Binding var current: String
    var title: String
    var animation: Namespace.ID

    var body: some View {
        VStack() {
            Button {
                withAnimation {
                    current = title
                }
            } label: {
                Text(title)
                    .font(.callout)
                    .foregroundColor(.black)
                    .fontWeight(current == title ? .bold : .light)
                    .frame(height: 20)
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 3)
                
                if current == title {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            }
        }.padding(0)
    }
}
