import ObjectMapper

/// This class represents the list of games that can be installed on a server.
open class GameList: Mappable {

    /// Returns the number of currently installed games.
    open fileprivate(set) var currentlyInstalled: Int?
    /// Returns the maximum amount of games that can be installed.
    open fileprivate(set) var maximumInstalled: Int?
    /// Returns the full list of games.
    open fileprivate(set) var allGames: [Game]?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        currentlyInstalled <- map["installed_currently"]
        maximumInstalled <- map["installed_maximum"]
        allGames <- map["games"]
    }
}
