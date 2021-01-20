//
//  ContentView.swift
//  MovieRecord
//
//  Created by User11 on 2021/1/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var songData = SongsData()
    var body: some View {
        VStack {
            TabView {
                MovieList(songsData: self.songData)
                    .tabItem {
                        Text("收錄電影")
                        Image(systemName: "film.fill")
                    }
                ChartView(songData: self.songData)
                    .tabItem{
                        Text("圖表分析")
                        Image(systemName: "chart.pie.fill")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
