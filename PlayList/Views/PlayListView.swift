//
//  PlayListView.swift
//  PlayList
//
//  Created by Yuliya  on 7/8/22.
//

import SwiftUI

struct PlayListView: View {
    
    @StateObject var viewModel = PlaylistViewModel()
    
    @State var title: String = ""
    
    var body: some View {
        HStack {
            NavigationView {
             
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "music.quarternote.3")
                        TextField("Enter genre title", text: $title)
                    }
                    Rectangle()
                        .frame(height: 2)
                        .padding(.horizontal)
                    List {
                        ForEach(viewModel.playlists) {
                            playlist in
                            NavigationLink {
                                SongListView(playList: .constant(playlist), playlistViewModel: viewModel)
                            } label: {
                                HStack {
                                    Image(systemName: "person")
                                    VStack(alignment: .leading) {
                                        Text(playlist.title)
                                            .font(.headline)
                                        Text("\(playlist.songs.count) song(s)")
                                            .font(.caption)
                                    }
                                }
                            }
                        }.onDelete(perform: viewModel.deletePlaylist(indexSet:))
                    }
                }.navigationBarTitle("My playlist")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                viewModel.createPlaylist(title: title)
                                title = ""
                            
                            } label: {
                            Image(systemName: "plus")
                            
                            }
                        }
                    }
            }.onAppear{
                viewModel.loadFromPersistanceStore()
            }
        }
    }
}


struct PlayListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayListView()
    }
}
