//
//  SongListViewModel.swift
//  PlayList
//
//  Created by Yuliya  on 7/8/22.
//

import Foundation

class SongListViewModel: ObservableObject {
    
    func createSong(song: Song, playlist: Playlist, playlistViewModel: PlaylistViewModel) {
      guard let index = playlistViewModel.playlists.firstIndex(of: playlist) else { return }
      playlistViewModel.playlists[index].songs.append(song)
    }

    func deleteSong(playlist: Playlist, playlistViewModel: PlaylistViewModel, at indexSet: IndexSet) {
      guard let index = playlistViewModel.playlists.firstIndex(of: playlist) else { return }
      playlistViewModel.playlists[index].songs.remove(atOffsets: indexSet)
    }
}
