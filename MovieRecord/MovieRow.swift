//
//  ContentView.swift
//  MovieRecord
//
//  Created by User11 on 2021/1/20.
//

import SwiftUI


struct MovieRow: View {
    var movie: Movie
    var bgcolor = ["FF5151", "FFAF60", "FFE153", "53FF53", "46A3FF", "B15BFF"]
    var body: some View {
        VStack{
            HStack {
                VStack {
                    Text(" \(movie.song) ")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .offset(x:-15)
                        .minimumScaleFactor(0.5)
                    Text(" \(movie.date.addingTimeInterval(600), style: .date)")
                        .font(.system(size: 20))
                        .offset(x:15)
                }
                Spacer()
                Group{
                    Text("喜好分數：\(movie.score)")
                    Image(systemName: movie.favorite ? "heart.fill": "heart")
                }
            }
        }
        .frame(height: 80)
//        .padding(.leading,5)
//        .padding(.trailing,5)
        .background(Color(UIColor(hexString:bgcolor[movie.score]).withAlphaComponent(CGFloat(1.0))))
        .cornerRadius(20)
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(song: "大海", date: Date(), selectType: "動作", score: 10,  favorite: true)).previewLayout(.sizeThatFits)
    }
}
