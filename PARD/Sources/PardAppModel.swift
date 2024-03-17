//
//  PardAppModel.swift
//  PARD
//
//  Created by 진세진 on 3/5/24.
//

import Foundation

struct UserInfo {
    var name: String
    var part: String
    var score: String
}

struct PardAppModel {
    static var userInfos: [UserInfo] = [
        UserInfo(name: "이주형", part: "iOS파트", score: "20점"),
        UserInfo(name: "홍길동", part: "안드로이드파트", score: "15점"),
        UserInfo(name: "이영희", part: "웹파트", score: "18점")
    ]
}
