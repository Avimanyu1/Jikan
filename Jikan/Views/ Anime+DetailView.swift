//
//  AnimeDetailView.swift
//  Jikan
//
//  Created by Avimanyu Roy on 18/05/23.
//

import SwiftUI

struct AnimeDetailView: View {
    var animeEntry: JikanAPI.Anime
    var imageURL: String {
        animeEntry.images.jpg.image_url.replacingOccurrences(of: ".jpg", with: "l.jpg")
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ModifiedAsyncImage(url: imageURL)
                    .scaledToFill()
                    .frame(height: 350, alignment: .top)
                    .clipped()
                HStack {
                    Text(animeEntry.title)
                        .fontWeight(.heavy)
                        .font(.system(size: 30))
                    Spacer()
                    
                    Text(String(animeEntry.rank ?? 42))
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .foregroundColor(.accentColor)
                }
                Text("Anime")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(animeEntry.synopsis!)
                    .fontWeight(.regular)
            }
            .padding()
            .navigationTitle(animeEntry.title)
        }
    }
}

//struct AnimeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimeDetailView(animeEntry: JikanAPI.sampleAnime)
//    }
//}
