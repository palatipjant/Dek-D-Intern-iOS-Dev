//
//  BannerModel.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 26/2/2567 BE.
//

import Foundation

struct BannerResponse: Codable {
    let list: [Banner]
}

struct Banner: Codable, Identifiable{
    let id: String
    let payload: Payload?
}

struct Payload: Codable{
    let url: String?
    let imageUrl: imageBanner?
}

struct imageBanner: Codable{
    let mobile: String?
    let tablet: String?
}
