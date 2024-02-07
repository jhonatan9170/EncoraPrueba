
import Foundation

// MARK: - PostsModel
struct PostsModel: Codable {
    let meta: Meta
    let data: [PostModel]
}

// MARK: - Meta
struct PostModel: Codable {
    let id, userID: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title, body
    }
}

// MARK: - Meta
struct Meta: Codable {
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, pages, page, limit: Int
    let links: Links
}

// MARK: - Links
struct Links: Codable {
    let previous: String?
    let current, next: String
}

struct PostEntity {
    let id: Int
    let title: String
    let subtitle: String
}

extension PostModel {
    var postEntity:PostEntity {
        return PostEntity(id: self.id, title: self.title, subtitle: self.body)
    }
}
