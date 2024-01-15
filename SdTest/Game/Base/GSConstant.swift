//
//  GSConstant.swift
//  SdTest
//
//  Created by admin on 10.01.2024.
//

import Foundation

struct GSConstant {
    static let shared = GSConstant()
    private init() {}
    
    let shipSpeed = 5.0
    let shipName = "ship"
    let shipImageName = "ship"
    let shipWithShieldImageName = "shipWithShield"
    
    let shieldName = "shield"
    let shieldImageName = "shield"
    
    let backSpeed = 1.0
    let back0Name = "back0"
    let back1Name = "back1"
    let backImageName = "background1"
    
    let backButtonName = "backButton"
    
    let backButtonImageName = "backArrow"
    
    let asteroidName = "asteroid"
    let asteroidImageName = "asteroid"
    
    let healthName = "health"
    
    let exploseImageName = "explose"
    
    let bombImageName = "bomb"
    let bombName = "bomb"
    
    let heartImageName = "heart"
    let heartName = "heart"
    
    let x2ImageName = "x2"
    let x2Name = "x2"
    
    let bossImageName = "boss"
    
    let bossBulletImageName = "bossBullet"
    let shipBulletImageName = "shipBullet"
    
    let shipHealthMap: [Int : CGFloat] = [
        1 : 1, 2 : 2, 3 : 3, 4 : 4, 5 : 5, 6 : 6, 7 : 7, 8 : 8, 9 : 9, 10 : 10
    ]
    
    let bossHealthMap: [Int : CGFloat] = [
        1 : 1,
        2 : 2,
        3 : 3,
        4 : 4,
        5 : 5,
        6 : 6,
        7 : 7,
        8 : 8,
        9 : 9,
        10 : 10,
        11 : 11,
        12 : 12,
        13 : 13,
        14 : 14,
        15 : 15,
        16 : 16,
        17 : 17,
        18 : 18,
        19 : 19,
        20 : 20
    ]
    
    let bossHealthMapLvl2: [Int : CGFloat] = [
        1 : 1,
        2 : 2,
        3 : 3,
        4 : 4,
        5 : 5,
        6 : 6,
        7 : 7,
        8 : 8,
        9 : 9,
        10 : 10,
        11 : 11,
        12 : 12,
        13 : 13,
        14 : 14,
        15 : 15,
        16 : 16,
        17 : 17,
        18 : 18,
        19 : 19,
        20 : 20,
        21 : 21,
        22 : 22,
        23 : 23,
        24 : 24,
        25 : 25,
        26 : 26,
        27 : 27,
        28 : 28,
        29 : 29,
        30 : 30
    ]
    
    let bossHealthMapLvl3: [Int : CGFloat] = [
        1 : 1,
        2 : 2,
        3 : 3,
        4 : 4,
        5 : 5,
        6 : 6,
        7 : 7,
        8 : 8,
        9 : 9,
        10 : 10,
        11 : 11,
        12 : 12,
        13 : 13,
        14 : 14,
        15 : 15,
        16 : 16,
        17 : 17,
        18 : 18,
        19 : 19,
        20 : 20,
        21 : 21,
        22 : 22,
        23 : 23,
        24 : 24,
        25 : 25,
        26 : 26,
        27 : 27,
        28 : 28,
        29 : 29,
        30 : 30,
        31 : 31,
        32 : 32,
        33 : 33,
        34 : 34,
        35 : 35,
        36 : 36,
        37 : 37,
        38 : 38,
        39 : 39,
        40 : 40
    ]
    
    let bossHealthMapLvl4: [Int : CGFloat] = [
        1 : 1,
        2 : 2,
        3 : 3,
        4 : 4,
        5 : 5,
        6 : 6,
        7 : 7,
        8 : 8,
        9 : 9,
        10 : 10,
        11 : 11,
        12 : 12,
        13 : 13,
        14 : 14,
        15 : 15,
        16 : 16,
        17 : 17,
        18 : 18,
        19 : 19,
        20 : 20,
        21 : 21,
        22 : 22,
        23 : 23,
        24 : 24,
        25 : 25,
        26 : 26,
        27 : 27,
        28 : 28,
        29 : 29,
        30 : 30,
        31 : 31,
        32 : 32,
        33 : 33,
        34 : 34,
        35 : 35,
        36 : 36,
        37 : 37,
        38 : 38,
        39 : 39,
        40 : 40,
        41 : 41,
        42 : 42,
        43 : 43,
        44 : 44,
        45 : 45,
        46 : 46,
        47 : 47,
        48 : 48,
        49 : 49,
        50 : 50
    ]
    
    let bossHealthMapLvl5: [Int : CGFloat] = [
        1 : 1,
        2 : 2,
        3 : 3,
        4 : 4,
        5 : 5,
        6 : 6,
        7 : 7,
        8 : 8,
        9 : 9,
        10 : 10,
        11 : 11,
        12 : 12,
        13 : 13,
        14 : 14,
        15 : 15,
        16 : 16,
        17 : 17,
        18 : 18,
        19 : 19,
        20 : 20,
        21 : 21,
        22 : 22,
        23 : 23,
        24 : 24,
        25 : 25,
        26 : 26,
        27 : 27,
        28 : 28,
        29 : 29,
        30 : 30,
        31 : 31,
        32 : 32,
        33 : 33,
        34 : 34,
        35 : 35,
        36 : 36,
        37 : 37,
        38 : 38,
        39 : 39,
        40 : 40,
        41 : 41,
        42 : 42,
        43 : 43,
        44 : 44,
        45 : 45,
        46 : 46,
        47 : 47,
        48 : 48,
        49 : 49,
        50 : 50,
        51 : 51,
        52 : 52,
        53 : 53,
        54 : 54,
        55 : 55,
        56 : 56,
        57 : 57,
        58 : 58,
        59 : 59,
        60 : 60
    ]
}

