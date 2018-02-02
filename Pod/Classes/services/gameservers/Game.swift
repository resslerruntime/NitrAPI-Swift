import ObjectMapper

/// This class represents a Game.
open class Game: Mappable {

    /// Returns id.
    open fileprivate(set) var id: Int!
    /// Returns steamId.
    open fileprivate(set) var steamId: Int?
    /// Returns hasSteamGame.
    open fileprivate(set) var hasSteamGame: String?
    /// Returns name.
    open fileprivate(set) var name: String!
    /// Returns minecraftMode.
    open fileprivate(set) var minecraftMode: Bool?
    /// Returns publicserverOnly.
    open fileprivate(set) var publicserverOnly: Bool?
    /// Returns portlistShort.
    open fileprivate(set) var portlistShort: String?
    /// Returns folderShort.
    open fileprivate(set) var folderShort: String?
    /// Returns installed.
    open fileprivate(set) var installed: Bool?
    /// Returns active.
    open fileprivate(set) var active: Bool?
    /// Returns minimumSlots.
    open fileprivate(set) var minimumSlots: Int?
    /// Returns enoughSlots.
    open fileprivate(set) var enoughSlots: Bool?
    /// Returns slotMultiplier.
    open fileprivate(set) var slotMultiplier: Int?
    /// Returns maximumRecommendedSlots.
    open fileprivate(set) var maximumRecommendedSlots: Int?
    /// Returns modpacks.
    open fileprivate(set) var modpacks: [Modpack]?
    /// Returns icons.
    open fileprivate(set) var icons: Icons?
    /// Returns locations.
    open fileprivate(set) var locations: [Int]?
    /// Returns tags.
    open fileprivate(set) var tags: [String]?
    /// Returns preorderLocations.
    open fileprivate(set) var preorderLocations: [Int]?
    /// Returns visible.
    open fileprivate(set) var visible: Bool?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        id <- map["id"]
        steamId <- map["steam_id"]
        hasSteamGame <- map["has_steam_game"]
        name <- map["name"]
        minecraftMode <- map["minecraft_mode"]
        publicserverOnly <- map["publicserver_only"]
        portlistShort <- map["portlist_short"]
        folderShort <- map["folder_short"]
        installed <- map["installed"]
        active <- map["active"]
        minimumSlots <- map["minimum_slots"]
        enoughSlots <- map["enough_slots"]
        slotMultiplier <- map["slot_multiplier"]
        maximumRecommendedSlots <- map["maximum_recommended_slots"]
        modpacks <- map["modpacks"]
        icons <- map["icons"]
        locations <- map["locations"]
        tags <- map["tags"]
        preorderLocations <- map["preorder_locations"]
        visible <- map["visible"]
    }

    /// This class represents an icons.
    open class Icons: Mappable {
        /// Returns x16.
        open fileprivate(set) var x16: String?
        /// Returns x32.
        open fileprivate(set) var x32: String?
        /// Returns x64.
        open fileprivate(set) var x64: String?
        /// Returns x128.
        open fileprivate(set) var x128: String?
        /// Returns x256.
        open fileprivate(set) var x256: String?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            x16 <- map["x16"]
            x32 <- map["x32"]
            x64 <- map["x64"]
            x128 <- map["x120"]
            x256 <- map["x256"]
        }
    }
}
