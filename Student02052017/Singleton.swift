//
//  Singleton.swift
//  Student02052017
//
//  Created by AlexanderYakovenko on 5/3/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class Singleton {
    static let instance = Singleton()
    var arrayStudent = [Student]()
    private init() {}
    func SetData (value: [Student]){
        arrayStudent = value
    }
    func GetData() -> [Student] {
        return arrayStudent
    }
    

}
