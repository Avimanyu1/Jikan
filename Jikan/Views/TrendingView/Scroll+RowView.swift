//
//  Scroll+RowView.swift
//  Jikan
//
//  Created by Avimanyu Roy on 20/05/23.
//

import SwiftUI

struct ScrollRowView: View {
    let source: [any Entry]
    let type: JikanAPI.FetchType.Categories
    var rowTitle: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(rowTitle)
                .bold()
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    if type == .anime {
                        ForEach(source, id: \.id) { entry in
                            
                            NavigationLink(destination: AnimeDetailView(animeEntry: entry as! JikanAPI.Anime),
                                           label: { Row(entry: entry) } ).buttonStyle(.plain)
                        }
                    }
                        else {
                            ForEach(source, id: \.id) { entry in
                                NavigationLink(destination: MangaDetailView(mangaEntry: entry as! JikanAPI.Manga),
                                               label: { Row(entry: entry) } ).buttonStyle(.plain)
                                
                            }
                        }
                    
                }
            }
        }
        .frame(height: CGFloat(120))
        .padding(.all)
    }
}

extension ScrollRowView {
    struct Row: View {
        var entry: any Entry
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .opacity(0.2)
                HStack {
                    ModifiedAsyncImage(url: entry.images.jpg.image_url)
                        .frame(width: 80, height: 80)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(entry.title)
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 80, alignment: .top)
                        .lineSpacing(.pi)
                }
            }
            .frame(width: CGFloat(200),height: CGFloat(100))
        }
    }
}

struct Scroll_RowView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollRowView(source: JikanAPI().animeRanking.data, type: .anime, rowTitle: "Test")
    }
}
