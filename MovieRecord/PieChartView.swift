//
//  ContentView.swift
//  MovieRecord
//
//  Created by User11 on 2021/1/20.
//

import SwiftUI

struct PieChartView: View {
    var percentages:[Double]?
    var angles: [Angle]
    
    init(percentages: [Double]){
        var sum: Double = 0
        var finalpercentage: [Double] = [0,0,0,0,0,0]
        for i in 0..<6 {
         sum = sum + percentages[i]
        }
        
        for j in 0..<6 {
            finalpercentage[j] = percentages[j] / sum
        }
        
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in finalpercentage {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage
        }
    }
    var body: some View {
        ZStack {
            PieChart(startAngle: self.angles[0], endAngle: self.angles[1])
                .fill(Color(red: 239/255, green: 79/255, blue: 79/255))
            PieChart(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color(red: 255/255, green: 157/255, blue: 114/255))
            PieChart(startAngle: self.angles[2], endAngle: self.angles[3])
                .fill(Color(red: 255/255, green: 214/255, blue: 107/255))
            PieChart(startAngle: self.angles[3], endAngle: self.angles[4])
                .fill(Color(red: 40/255, green: 223/255, blue: 123/255))
            PieChart(startAngle: self.angles[4], endAngle: self.angles[5])
                .fill(Color(red: 7/255, green: 104/255, blue: 200/255))
            PieChart(startAngle: self.angles[5], endAngle: self.angles[0])
                .fill(Color(red: 134/255, green: 117/255, blue: 220/255))
        }
        .frame(width: 300, height: 300)
        .offset(y: -100)
    }
}

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [15, 10, 15, 20, 25, 15])
    }
}
