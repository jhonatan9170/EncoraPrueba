import Foundation

struct CountryModel: Codable {
    let name: Name
    let capital: [String]?
    let region: String
    let subregion: String?
    let population: Int
    let area: Double?
    let flag: String
    let flags: Flags
    let currencies: [String: Currency]?
    let languages: [String: String]?

    struct Name: Codable {
        let common: String
        let official: String
        let nativeName: [String: NativeName]?
    }

    struct NativeName: Codable {
        let official: String?
        let common: String?
    }

    struct Flags: Codable {
        let png: String?
        let svg: String?
    }

    struct Currency: Codable {
        let name: String
        let symbol: String?
    }
}
extension CountryModel: Equatable {
    static func == (lhs: CountryModel, rhs: CountryModel) -> Bool {
        return lhs.name.common == rhs.name.common
    }
}
