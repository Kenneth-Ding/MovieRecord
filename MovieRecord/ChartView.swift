//
//  ContentView.swift
//  MovieRecord
//
//  Created by User11 on 2021/1/20.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var songData = SongsData()
    @State private var selectedChart = "圓餅圖"
    var chart = ["圓餅圖", "柱狀圖"]
    var type = [ "動作", "浪漫", "驚悚", "科幻", "喜劇", "動畫"]
    var typeCount: [Double] = [0,0,0,0,0,0,0]
    
    init (songData: SongsData){
        for song in songData.songs{
            for i in 0..<6 {
                if song.selectType == type[i]{
                    typeCount[i] += 1
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.init(red: 222/255, green: 232/255, blue: 255/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("bg")
                    .resizable()
                Text("我的電影喜好分析")
                    .font(.system(size: 28))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Picker(selection: $selectedChart, label: Text("分析圖表")) {
                    ForEach(self.chart, id: \.self) { (Chart) in
                        Text(Chart)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                picture()
                if self.selectedChart == "圓餅圖" {
                    PieChartView(percentages: typeCount)
                    .frame(width: 400, height: 300)
                        .offset(y:100)
                }
                else if self.selectedChart == "柱狀圖" {
                    BarChartView(typeWidths: typeCount)
                    .frame(width: 400, height: 300)
                        .offset(y: 30)
                }
            }
            .foregroundColor(Color(red: 253/255, green: 232/255, blue: 205/255))
            .offset(x: 0, y: -20)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(songData: SongsData())
    }
}

struct picture: View {
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .fill(Color(red: 239/255, green: 79/255, blue: 79/255))
                    .frame(width: 20, height: 20)
                Text("動作")
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Circle()
                    .fill(Color(red: 255/255, green: 157/255, blue: 114/255))
                    .frame(width: 20, height: 20)
                Text("浪漫")
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Circle()
                    .fill(Color(red: 255/255, green: 214/255, blue: 107/255))
                    .frame(width: 20, height: 20)
                Text("驚悚")
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Circle()
                    .fill(Color(red: 40/255, green: 223/255, blue: 123/255))
                    .frame(width: 20, height: 20)
                Text("科幻")
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Circle()
                    .fill(Color(red: 7/255, green: 104/255, blue: 200/255))
                    .frame(width: 20, height: 20)
                Text("喜劇")
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Circle()
                    .fill(Color(red: 134/255, green: 117/255, blue: 220/255))
                    .frame(width: 20, height: 20)
                Text("動畫")
                    .foregroundColor(.black)
                Spacer()
            }
        }.offset(x: 20, y : 10)
    }
}
