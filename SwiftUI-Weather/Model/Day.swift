//
//  Day.swift
//  SwiftUI-Weather
//
//  Created by Jainam Shah  on 11/5/20.
//

import Foundation

struct Day : Identifiable {
    var id = UUID()
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    
    init(dayofWeek : String, image: String,temp:Int) {
        self.dayOfWeek = dayofWeek
        self.imageName = image
        self.temperature = temp
    }
}
