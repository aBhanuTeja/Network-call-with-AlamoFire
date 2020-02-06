//
//  GETMethodModel.swift
//  API call using Aamofire
//
//  Created by Bhanuteja on 06/02/20.
//  Copyright © 2020 annam. All rights reserved.
//

import Foundation
import ObjectMapper

class GETDetailsResponse: Mappable {
    var items: [Item]?
    var hasMore: Bool?
    var quotaMax, quotaRemaining: Int?

    required init?(map: Map) {
    }
    func mapping(map: Map) {
        items <- map["items"]
        hasMore <- map["has_more"]
        quotaMax <- map["quota_max"]
        quotaRemaining <- map["quota_remaining"]
    }
}

class Item: Mappable {
    var tags: [String]?
    var owner: Owner?
    var isAnswered: Bool?
    var viewCount, protectedDate: Int?
    var acceptedAnswerID: Int?
    var answerCount, score, lastActivityDate, creationDate: Int?
    var lastEditDate, questionID: Int?
    var link: String?
    var title: String?
    var communityOwnedDate, lockedDate: Int?

    required init?(map: Map) {
    }
    func mapping(map: Map) {
        tags <- map["tags"]
        owner <- map["owner"]
        isAnswered <- map["is_answered"]
        viewCount <- map["view_count"]
        protectedDate <- map["protected_date"]
        acceptedAnswerID <- map["accepted_answer_id"]
        answerCount <- map["answer_count"]
        score <- map["score"]
        lastActivityDate <- map["last_activity_date"]
        creationDate <- map["creation_date"]
        lastEditDate <- map["last_edit_date"]
        questionID <- map["question_id"]
        link <- map["link"]
        title <- map["title"]
        communityOwnedDate <- map["community_owned_date"]
        lockedDate <- map["locked_date"]
    }
}

class Owner: Mappable {
    var reputation, userID: Int?
    var acceptRate: Int?
    var profileImage: String?
    var displayName: String?
    var link: String?

    required init?(map: Map) {
    }
    func mapping(map: Map) {
        reputation <- map["reputation"]
        userID <- map["user_id"]
        acceptRate <- map["accept_rate"]
        profileImage <- map["profile_image"]
        displayName <- map["display_name"]
        link <- map["link"]
    }
}
