//
//  Camper.swift
//  StudyJson
//
//  Created by Yejin Hong on 3/16/24.
//

struct Camper: Decodable {
    let nickName: String
    let generation: Int
    let cellPhone: String
    
    private enum CodingKeys: String, CodingKey {
        case nickName = "nick_name"
        case generation
        case cellPhone = "cell_phone"
    }
}
