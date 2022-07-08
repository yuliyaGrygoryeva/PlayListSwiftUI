//
//  PlayList.swift
//  PlayList
//
//  Created by Yuliya  on 7/8/22.
//

import Foundation

struct Playlist: Equatable, Codable, Identifiable {
    var title: String
    var songs: [Song] = []
    var id = UUID()
    
}
