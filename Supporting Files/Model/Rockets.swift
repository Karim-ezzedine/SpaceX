//
//  Rockets.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation
import AlamofireImage

class GetRocketsResult: Codable {
    let rockets: Rockets
    
    enum CodingKeys: String, CodingKey {
        case rockets = "docs"
    }
}

typealias Rockets = [Rocket]

// MARK: - Rocket
class Rocket: Codable {
    
    private let flickrImages: [String]?
    private let name: String?
    private let wikipedia: String?
    private let description, id: String?

    enum CodingKeys: String, CodingKey {
        case flickrImages = "flickr_images"
        case name, wikipedia
        case description
        case id
    }

    init(flickrImages: [String]? = nil, name: String? = nil, wikipedia: String? = nil, description: String? = nil, id: String? = nil) {
        self.flickrImages = flickrImages
        self.name = name
        self.wikipedia = wikipedia
        self.description = description
        self.id = id
    }
    
    
    //MARK: - Geters
    var rocketName: String { return name ?? "" }
    var rocketDescription: String { return description ?? "" }
    var wikipediaLink: String { return wikipedia ?? "" }
    
    var imagePath: String {
        if let path = (flickrImages ?? []).first {
            return path
        }
        else {
            return ""
        }
    }
}
