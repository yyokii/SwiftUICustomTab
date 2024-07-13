//
//  ContentView.swift
//  DemoCustomTabView
//
//  Created by Higashihara Yoki on 2024/07/12.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: TabItem = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                SampleView(
                    title: selectedTab.title,
                    itemColor: .cyan
                )
                .transition(.move(edge: .leading))
            case .myPage:
                SampleView(
                    title: selectedTab.title,
                    itemColor: .orange
                )
                .transition(.move(edge: .trailing))
            }

            HStack(alignment: .center, spacing: 24) {
                ForEach((TabItem.allCases), id: \.self){ item in
                    tabItem(of: item)
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .background(.thinMaterial, in: Capsule())
        }
    }

    func tabItem(of item: TabItem) -> some View {
        Button{
            withAnimation {
                selectedTab = item
            }
        } label: {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: item.iconName)
                    .font(.system(size: 16))
                    .foregroundStyle( selectedTab == item ? .black : .gray)
                Text(item.title)
                    .font(.headline)
                    .foregroundStyle( selectedTab == item ? .black : .gray)
            }
        }
    }
}

struct SampleView: View {
    let title: String
    let itemColor: Color

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<10, id: \.self){ item in
                        RoundedRectangle(cornerRadius: 16)
                            .fill(itemColor)
                            .frame(height: 100)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(title)
        }
    }
}

#Preview {
    ContentView()
}
