//
//  Poet.swift
//  IRTestTests
//
//  Created by Phil Chang on 2023/7/19.
//  Copyright © 2023 . All rights reserved.
//        

class Poet: Person {
    override var greeting: String {
        get {
            if isHappy {
                return "Oh, joyous day!"
            } else {
                return "Woe is me!"
            }
        }
    }
}
