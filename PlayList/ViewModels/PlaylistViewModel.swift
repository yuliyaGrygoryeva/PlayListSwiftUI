//
//  PlaylistViewModel.swift
//  PlayList
//
//  Created by Yuliya  on 7/8/22.
//

import Foundation

class PlaylistViewModel: ObservableObject {
    // SOT
    @Published var playlists: [Playlist] = [Playlist(title: "Hip Hop", songs: [Song(title: "a", artist: "1"),
                                                                               Song(title: "b", artist: "2"),
                                                                               Song(title: "c", artist: "3"),
                                                                               Song(title: "d", artist: "4")]),

                                                                               Playlist(title: "Metal", songs: [Song(title: "e", artist: "5"),
                                                                               Song(title: "f", artist: "6"),
                                                                               Song(title: "g", artist: "7"),
                                                                               Song(title: "h", artist: "8"),
                                                                               Song(title: "j", artist: "9")]),

                                                                               Playlist(title: "Rap", songs: [Song(title: "k", artist: "00"),
                                                                               Song(title: "l", artist: "01"),
                                                                               Song(title: "m", artist: "02"),
                                                                               Song(title: "n", artist: "03"),
                                                                               Song(title: "o", artist: "04")]),

                                                                               Playlist(title: "Pop", songs: [Song(title: "p", artist: "a"),
                                                                               Song(title: "q", artist: "b"),
                                                                               Song(title: "r", artist: "c"),
                                                                               Song(title: "s", artist: "d"),
                                                                               Song(title: "t", artist: "e")])]
    
    // CRUD
    func createPlaylist(title: String){
        let newPlaylist = Playlist(title: title, songs: [])
        playlists.append(newPlaylist)
        saveToPersistenceStore()
    }
    
    func deletePlaylist(indexSet: IndexSet){
        playlists.remove(atOffsets: indexSet)
        saveToPersistenceStore()
    }
    
    
    
    // MARK: - Persistence
    // create a place to store data, save data, load data
    func createPersistanceStore() -> URL {   //URL is an address in memory
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Playlist.json")
        return fileURL
    }
    
    func saveToPersistenceStore(){
        do {
            let data = try JSONEncoder().encode(playlists)
            try data.write(to: createPersistanceStore())
            
        } catch {
            print("Error encoding.")
        }
    }
    
    func loadFromPersistanceStore(){
        do {
            let data = try Data(contentsOf: createPersistanceStore())
            //                             decode as  ,  decode from
            playlists = try JSONDecoder().decode([Playlist].self, from: data)
        }
        catch {
            print("Error decoding.")
        }
    }

    
}
