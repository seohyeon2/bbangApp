//
//  TopTapBarContent.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/02.
//

import SwiftUI

struct TopTapBarContent: View {
    var current: String
    var body: some View {
        if current == "추천" {
            Recommendation()
        }
    }
}
