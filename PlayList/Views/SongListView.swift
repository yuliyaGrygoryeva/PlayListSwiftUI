//
//  SongListView.swift
//  PlayList
//
//  Created by Yuliya  on 7/8/22.
//

import SwiftUI

struct SongListView: View {
    
    @State private var title: String = ""
    @State private var artist: String = ""
    @StateObject var viewModel = SongListViewModel()
    @Binding var playList: Playlist
    
    var playlistViewModel: PlaylistViewModel
    
    var body: some View {
        VStack {
            Text("")
                .navigationBarTitle("Songs", displayMode: .inline)
            VStack {
                TextField("Title", text: $title)
                    .padding(8)
                Rectangle()
                    .frame(height: 2)
                    .padding(.horizontal)
                
                TextField("Artist", text: $artist)
                Rectangle()
                    .frame(height: 2)
                    .padding(.horizontal)
            }
            .padding(8)
        }
        
        List{
            ForEach(playList.songs) { song in
                //songs rows
                HStack {
                    
                    Image(systemName: "person")
                        .imageScale(.large)
                    
                    VStack(alignment: .leading) {
                        Text(song.title)
                            .font(.headline)
                        Text(song.artist)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.green)
                        .padding()
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                    
                }.padding()
                
            }
            .onDelete { indexSet in viewModel.deleteSong(playlist: playList, playlistViewModel: playlistViewModel, at: indexSet)
             }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.createSong(song: Song(title: title, artist: artist), playlist: playList, playlistViewModel: playlistViewModel)
                    title = ""
                    artist = ""
                } label: {
                    Text("Save")
                }
            }
        }
    }
}
struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(playList: .constant(Playlist(title: "SongTitle", songs: [Song(title: "Song1", artist: "artist1")])), playlistViewModel: PlaylistViewModel())
    }
}
