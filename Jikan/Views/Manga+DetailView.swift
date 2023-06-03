//
//  Manga+DetailView.swift
//  Jikan
//
//  Created by Avimanyu Roy on 20/05/23.
//

import SwiftUI

struct MangaDetailView: View {
    var mangaEntry: JikanAPI.Manga
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    ModifiedAsyncImage(url: mangaEntry.images.jpg.image_url)
                        .scaledToFill()
                        .frame(height: 350, alignment: .top)
                        .clipped()
                    HStack {
                        Text(mangaEntry.title)
                            .fontWeight(.heavy)
                            .font(.system(size: 30))
                        Spacer()
                        
                        Text(String(mangaEntry.rank ?? 42))
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                            .foregroundColor(.accentColor)
                    }
                    Text("Manga")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(mangaEntry.synopsis ?? "No synopsis")
                        .fontWeight(.regular)
                }
                .padding()
                .navigationTitle(mangaEntry.title)
            }
    }
}

//struct AnimeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimeDetailView(animeEntry: JikanAPI.sampleAnime)
//    }
//}
