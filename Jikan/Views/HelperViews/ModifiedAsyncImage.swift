//
//  ModifiedAsyncImage.swift
//  Jikan
//
//  Created by Avimanyu Roy on 20/05/23.
//

import SwiftUI

struct ModifiedAsyncImage: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)! ,
                   transaction: Transaction(animation: .easeInOut)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .transition(.scale(scale: 0.1, anchor: .center))
            case .failure:
                Image(systemName: "wifi.slash")
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct ModifiedAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        ModifiedAsyncImage(url: "https://cdn.myanimelist.net/images/anime/1208/94745.jpg")
    }
}
