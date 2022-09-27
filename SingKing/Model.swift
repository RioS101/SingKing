//
//  Model.swift
//  SingKing
//
//  Created by RS on 27.09.22.
//

import Foundation


struct APIResponse: Codable {
    var characters: [Character]
}

struct Character {
    var id: Int
    var name: String
    var birthday: String
    var occupation: [String]
    var imageURL: String
    var status: String
    var nickName: String
    var seasons: [Int]
    var portrayed: String
    
    init(id: Int, name: String, birthday: String, occupation: [String], imageURL: String, status: String, nickName: String, seasons: [Int], portrayed: String) {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.occupation = occupation
        self.imageURL = imageURL
        self.status = status
        self.nickName = nickName
        self.seasons = seasons
        self.portrayed = portrayed
    }
}

extension Character: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name
        case birthday
        case occupation
        case imageURL = "img"
        case status
        case nickName
        case seasons = "appearance"
        case portrayed
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthday = try container.decode(String.self, forKey: .birthday)
        self.occupation = try container.decode([String].self, forKey: .occupation)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        self.status = try container.decode(String.self, forKey: .status)
        self.nickName = try container.decode(String.self, forKey: .nickName)
        self.seasons = try container.decode([Int].self, forKey: .seasons)
        self.portrayed = try container.decode(String.self, forKey: .portrayed)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.birthday, forKey: .birthday)
        try container.encode(self.occupation, forKey: .occupation)
        try container.encode(self.imageURL, forKey: .imageURL)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.nickName, forKey: .nickName)
        try container.encode(self.seasons, forKey: .seasons)
        try container.encode(self.portrayed, forKey: .portrayed)
    }
}
