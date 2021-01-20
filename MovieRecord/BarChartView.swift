//
//  BarChartView.swift
//  HW4-00757005
//
//  Created by User11 on 2021/1/17.
//

import SwiftUI

struct BarChartView: View {
    var typeWidths: [Double]

    var body: some View {
        HStack {
            BarChart(Width: typeWidths[0])
                .foregroundColor(Color(red: 239/255, green: 79/255, blue: 79/255))
            BarChart(Width: typeWidths[1])
                .foregroundColor(Color(red: 255/255, green: 157/255, blue: 114/255))
            BarChart(Width: typeWidths[2])
                .foregroundColor(Color(red: 255/255, green: 214/255, blue: 107/255))
            BarChart(Width: typeWidths[3])
                .foregroundColor(Color(red: 40/255, green: 223/255, blue: 123/255))
            BarChart(Width: typeWidths[4])
                .foregroundColor(Color(red: 7/255, green: 104/255, blue: 200/255))
            BarChart(Width: typeWidths[5])
                .foregroundColor(Color(red: 134/255, green: 117/255, blue: 220/255))
        }.offset(x: 0, y: -30)
    }
}

struct BarChart: View{
    @State private var width: CGFloat = 0
    var Width: Double

    var body: some View{
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(Color(red: 253/255, green: 232/255, blue: 205/255))
                .frame(width: 30, height: 220)
            VStack(spacing: 3) {
                Rectangle()
                    .frame(width: 30, height: width*20)
                    .animation(.linear(duration: 1))
                    .onAppear{
                        self.width = CGFloat(self.Width)
                }
                Text("\(Int(self.Width))")
                    .foregroundColor(.black)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(typeWidths: [2, 10, 10, 10, 10, 10, 10])
    }
}
