//
//  Model.swift
//  Jikan
//
//  Created by Avimanyu Roy on 19/05/23.
//

import Foundation

final class JikanAPI: ObservableObject {
    static let apiURL = "https://api.jikan.moe/v4/"
    private let decoder = JSONDecoder()
    
    @Published var animeRanking = Listing(data: [Anime]())
    @Published var mangaRanking = Listing(data: [Manga]())
    @Published var charRanking = Listing(data: [Character]())
    init() {
        Task {
            await fetch(.top(.anime))
            await fetch(.top(.manga))
        }
    }
}




extension JikanAPI {
    struct Image: Codable {
        var jpg : ImageSource
        
        struct ImageSource: Codable {
            var image_url: String
        }
    }
    
    struct Studio: Codable {
        var mal_id: Int
        var type: String
        var name: String
    }
    
    struct Anime: Entry, Codable {
        var id: Int { mal_id }
        private var mal_id: Int
        var title: String
        var rank: Int?
        var popularity: Int?
        var synopsis: String?
        var background: String?
        var images : Image
        var type: String?
        var source: String?
        var episodes: Int?
        var duration: String?
        var status: String?
        var rating: String?
        var score: Double?
        var season: String?
        var year: Int?
        var studios: [Studio]
    }
    
    struct Manga: Entry, Codable {
        var id: Int { mal_id }
        private var mal_id: Int
        var title: String
        var rank: Int?
        var popularity: Int?
        var synopsis: String?
        var background: String?
        var images : Image
        var type: String
        var chapters: Int?
        var volumes: Int?
        var status: String?
        var rating: String?
        var score: Double?
        var season: String?
        var year: Int?
        var authors: [Studio]
    }
    
    struct Character: Codable {
        var id: Int { mal_id }
        private var mal_id: Int
        var name: String
        var about: String
        var images : Image
        var nicknames: [String]
    }
    
    struct Listing<T>: Codable where T: Codable {
        var data: [T]
    }
}

extension JikanAPI {
    
    enum FetchType {
        case top(Categories)
        case random(Categories)
        
        
        
        enum Categories: String {
            case anime
            case manga
            case character
        }
    }
    
    func fetch(_ dataOf: JikanAPI.FetchType) async {
        
        var url = JikanAPI.apiURL
        switch dataOf {
        case .top(let categories):
            url += String("top/")+categories.rawValue
        case .random(let categories):
            url += String("random/")+categories.rawValue
        }
        
        let (data, response) = try! await URLSession.shared.data(from: URL(string: url)!)
        
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print(response)
            //self.handleServerError(response)
            //fatalError("\(String(describing: response))")
            return
        }
        
        switch dataOf {
        case .top(let categories):
            
            switch categories {
            case .anime:
                animeRanking = try! decoder.decode(JikanAPI.Listing.self, from: data)
            case .manga:
                mangaRanking = try! decoder.decode(JikanAPI.Listing.self, from: data)
            case .character:
                charRanking = try! decoder.decode(JikanAPI.Listing.self, from: data)
            }
        case .random(let categories):
            switch categories {
            case .anime:
//                randomAnime = try! decoder.decode(Dictionary<String,Anime>.self, from: data)
                break
            case .manga:
//                randomManga = try! decoder.decode(Dictionary<String,Manga>.self, from: data)
                break
            case .character:
                break
            }
        }
        
    }
}





protocol Entry: Identifiable {
    var id: Int { get }
    var title: String { get }
    var rank: Int? { get }
    var synopsis: String? { get }
    var images : JikanAPI.Image { get }
}



