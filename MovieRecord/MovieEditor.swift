//
//  ContentView.swift
//  MovieRecord
//
//  Created by User11 on 2021/1/20.
//

import SwiftUI

struct SongEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var songsData: SongsData
    @State private var movie = ""
    @State private var singer = ""
    @State private var selectDate = Date()
    @State private var selectType = ""
    @State private var score : CGFloat = 1
    @State private var favorite = true
    var editSong: Movie?
    var type = [ "動作", "浪漫", "驚悚", "科幻", "喜劇", "動畫"]
    
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year,value: -30, to: Date())!
    
    var body: some View {
            Form {
                TextField("電影名稱", text: $movie)
                DatePicker("觀看日期", selection: self.$selectDate, in: self.startDate...self.today, displayedComponents: .date)
                VStack{
                    Picker(selection: $selectType, label: Text("電影類別 ")) {
                        ForEach(self.type, id:\.self) { (type) in
                            Text(type)
                        }
                    }
                }
                
                HStack {
                    Text("評價 :  \(Int(score))")
                    Slider(value: $score, in: 1...5, step: 1)
                    Stepper(String(""), value: $score, in: 1...5, step: 1)
                }
                
                Toggle("是否加入至最愛清單？", isOn:  $favorite)
            }
            .navigationBarTitle(editSong == nil ? "新增電影" : "編輯電影")
            .navigationBarItems(trailing: Button("新增"){
                let song = Movie(song: self.movie, date: selectDate, selectType: self.selectType, score: Int(self.score),  favorite: self.favorite)
                if let editSong = self.editSong{
                    let index = self.songsData.songs.firstIndex{
                        $0.id == editSong.id
                    }!
                    self.songsData.songs[index] = song
                } else{
                    self.songsData.songs.insert(song, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(movie.isEmpty ||  selectType.isEmpty))
            .onAppear{
                if let editSong = self.editSong, self.movie == "" {
                    self.movie = editSong.song
                    self.selectType = editSong.selectType
                    self.score = CGFloat(editSong.score)
                    self.favorite = editSong.favorite
                }
            }
    }
}

struct SongEditor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SongEditor(songsData: SongsData())
        }
    }
}

extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)
        print(a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
}

extension UIColor {
    func toAlpha() -> Float {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let alpha = Float(a)
        return alpha
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
