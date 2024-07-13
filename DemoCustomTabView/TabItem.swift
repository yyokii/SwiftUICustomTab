//
//  TabItem.swift
//  DemoCustomTabView
//
//  Created by Higashihara Yoki on 2024/07/12.
//

import Foundation

enum TabItem: CaseIterable{
    case home
    case myPage

    var title: String{
        switch self {
        case .home:
            return "Home"
        case .myPage:
            return "MyPage"
        }
    }

    var iconName: String{
        switch self {
        case .home:
            return "house"
        case .myPage:
            return "person"
        }
    }
}
