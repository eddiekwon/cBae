//
//  UnsplashModel.swift
//  cBae
//
//  Created by muzna on 2020/12/07.
//
 
import Foundation  
 
// MARK: - WelcomeElement
struct UnsplashModel: Codable {
    let id: String?
    let createdAt, updatedAt: Date?
    let promotedAt: Date?
    let width, height: Int?
    let color: String?
    let welcomeDescription: String?
    let alt_description: String?
    let urls: Urls
    let links: WelcomeLinks?
//    let categories: [Any?]?
    let likes: Int?
    let likedByUser: Bool?
//    let currentUserCollections: [Any?]?
    let sponsorship: Sponsorship?
    let user: User?
}
 

// MARK: - WelcomeLinks
struct WelcomeLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
//    let impressionUrls: [String?]?
    let tagline: String?
    let taglineURL: String?
    let sponsor: User?
}

// MARK: - User
struct User: Codable {
    let id: String?
    let updatedAt: Date?
    let username, name, firstName: String?
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos: Bool?
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb: String
}

