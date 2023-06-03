//
//  TrendingView.swift
//  Jikan
//
//  Created by Avimanyu Roy on 20/05/23.
//

import SwiftUI

struct TrendingView: View {
    @EnvironmentObject var api: JikanAPI
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ScrollRowView(source: api.animeRanking.data, type: .anime, rowTitle: "Top Anime")
                    ScrollRowView(source: api.mangaRanking.data, type: .manga, rowTitle: "Top Manga")
                }
                
            }
            .navigationTitle("Featured")
        }
        //        .onAppear { //dont. just dont.
        //            Task {
        //                await api.fetch(.random(.anime))
        //                await api.fetch(.random(.manga))
        //            }
        //        }
        
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
            .environmentObject(JikanAPI())
    }
}
