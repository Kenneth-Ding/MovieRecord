//
//  MoviesData.swift
//  MovieRecord
//
//  Created by User11 on 2021/1/20.
//

import Foundation
import Combine

class SongsData: ObservableObject{
    var cancellable: AnyCancellable?
    @Published var songs = [Movie]()
    
    init(){
        if let data = UserDefaults.standard.data(forKey: "movies"){
          let decoder = JSONDecoder()
          if let decodedData = try? decoder.decode([Movie].self, from: data){
            songs = decodedData
          }
        }
        cancellable = $songs
            .sink(receiveValue: { (value) in
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(value) {
              UserDefaults.standard.set(data, forKey: "movies")
             }
            })
    }
}
