//
//  NovelModel.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 21/2/2567 BE.
//

import Foundation

struct NovelResponse: Codable {
    let list: [NovelList]
}

struct NovelList: Codable {
    let novel: Novel?
}

struct Novel: Codable, Identifiable{
    let id: Int
    let updatedAt: String?
    let title: String?
    let type: String?
    let description: String?
    let totalChapter: Int?
    let category: Category?
    let thumbnail: Thumbnail?
    let tags: [String]?
    let owners: [Owners]?
    let engagement: Engagement?
}

struct Category: Codable{
    let main: Int
    let sub: Int
    let mainTitle: String?
    let subTitle: String?
}

struct Thumbnail: Codable{
    let normal: String?
    let landscape: String?
}

struct Owners: Codable, Identifiable{
    let id: Int
    let username: String
    let alias: String?
    let role: String?
}

struct Engagement: Codable{
    let view: EngageView?
    let comment: EngageComment?
    
    struct EngageView: Codable{
        let month: Int
        let overall: Int
    }
    struct EngageComment: Codable{
        let primary: Int
        let overall: Int
    }
}

class Mockdata{
    static let sampledata = NovelList(novel: Novel(id: 2540391,
                                  updatedAt: "2024-02-25T12:35:04+07:00",
                                  title: "ข้ามาทำฟาร์มในโลกเซียน",
                                  type: "long",
                                                   description: "นักล่าค่าหัวมือหนึ่งทะลุมิติมาตื่นในร่างหญิงไร้พลังในโลกเซียน เพราะมีสามีและลูกชายเคียงข้าง นางทำฟาร์ม เลี้ยงอสูรมายา ผจญภัยหาทรัพยากรล้ำค่า ทว่าความลับแห่งชะตากรรมจะนำนางไปสู่ความจริงอันน่าประหลาดใจ", totalChapter: 114, 
                                                   category: Category(main: 1,
                                                                      sub: 18,
                                                                      mainTitle: "ฟรีสไตล์",
                                                                      subTitle: "นิยายวิทยาศาสตร์"),
                                thumbnail: Thumbnail(normal: "https://image.dek-d.com/28/0923/7012/t_134104965",
                                                     landscape: "https://image.dek-d.com/contentimg/writer/assets/thumbnail/novel/t_default.webp"),
                                                  tags: ["tag1", "tag2"],
                                                   owners:[ Owners(id: 5008631, username: "JourDek-D", alias: "高興", role: "owner")], 
                                                   engagement: Engagement(view: Engagement.EngageView(month: 12, overall: 156), comment: Engagement.EngageComment(primary: 123, overall: 1569))))
}
