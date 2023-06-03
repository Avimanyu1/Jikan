//
//  CardView.swift
//  Jikan
//
//  Created by Avimanyu Roy on 20/05/23.
//

import SwiftUI

struct CardView: View {
    var featuring: any Entry
    private var largeImageURL: String {
        featuring.images.jpg.image_url.replacingOccurrences(of: ".jpg", with: "l.jpg")
    }
    var body: some View {
        ZStack {
            ModifiedAsyncImage(url: largeImageURL)
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay {
                    TextOverlay(string: featuring.title)
                }
        }
    }
}

struct TextOverlay: View {
    var string: String

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(string)
                    .font(.title)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

