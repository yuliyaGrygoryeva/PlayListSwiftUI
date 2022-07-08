//
//  Song.swift
//  PlayList
//
//  Created by Yuliya  on 7/8/22.
//

import Foundation

struct Song: Codable, Equatable, Identifiable {
    var title: String
    var artist: String
    var id = UUID()
}
