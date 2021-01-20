//
//  ContentView.swift
//  MovieRecord
//
//  Created by User11 on 2021/1/20.
//

import SwiftUI

struct MovieList: View {
    @ObservedObject var songsData = SongsData()
    @State private var show = false
    var body: some View {
        NavigationView {
            List {
                ForEach(songsData.songs){ (index) in
                    NavigationLink(destination: SongEditor(songsData:  self.songsData, editSong: index)) {
                        MovieRow(movie: index)
                    }
                }
                .onMove { (indexSet, index) in
                    self.songsData.songs.move(fromOffsets: indexSet, toOffset: index)
                }
                .onDelete{ (index) in
                    self.songsData.songs.remove(atOffsets: index)
                }
            }
            .navigationBarTitle("收錄電影")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    self.show = true
                },label: {
                    Image(systemName: "plus")
                    }))
                .sheet(isPresented: $show){
                    NavigationView {
                        SongEditor(songsData: self.songsData)
                    }
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
