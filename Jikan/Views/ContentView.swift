//
//  ContentView.swift
//  Jikan
//
//  Created by Avimanyu Roy on 19/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: SelectedView = .featured

    var body: some View {
        NavigationView {
            TabView(selection: $selected) {
                TrendingView()
                    .tabItem {
                        Label(SelectedView.featured.rawValue, systemImage: "chart.line.uptrend.xyaxis.circle")
                    }
                    .tag(SelectedView.featured)
                
                TrendingView()
                    .tabItem {
                        Label(SelectedView.following.rawValue, systemImage: selected != .following ? "list.bullet.circle" : "list.bullet.circle.fill")
                    }
                    .tag(SelectedView.following)
                
                TrendingView()
                    .tabItem {
                        Label(SelectedView.search.rawValue, systemImage: "magnifyingglass.circle")
                    }
                    .tag(SelectedView.search)
            }
        }
    }
}



extension ContentView {
    private enum SelectedView: String {
        case featured = "Featured"
        case following = "Following"
        case search = "Search"
        
        var id: String { self.rawValue }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
