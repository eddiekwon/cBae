//
//  UnsplashModel.swift
//  cBae
//
//  Created by SWAhn on 2020/12/07.
//

import Foundation


struct UnsplashModel: Codable {
    let id: String?
    let createdAt, updatedAt: Date?
    let promotedAt: Date?
    let width, height: Int?
    let color: String?
//    let welcomeDescription: String?
//    let alt_description: String?
//    let urls: Urls
//    let links: WelcomeLinks?
//    //    let categories: [Any?]?
//    let likes: Int?
//    let likedByUser: Bool?
//    //    let currentUserCollections: [Any?]?
//    let sponsorship: Sponsorship?
//    let user: User?
}
