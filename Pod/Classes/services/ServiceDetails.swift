import ObjectMapper

/// Details of the service
open class ServiceDetails: Mappable {
    
    // MARK: - Attributes
    
    /// ip address and port of the service
    open fileprivate(set) var address: String?
    /// name of the service
    open fileprivate(set) var name: String?
    open fileprivate(set) var game: String?
    open fileprivate(set) var portlistShort: String?
    open fileprivate(set) var folderShort: String?
    /// Type of the server if it is a voiceserver
    open fileprivate(set) var type: String? // TODO: enum?
    
    // MARK: - Initialization
    
    public required init?(map: Map) {
    }
    
    open func mapping(map: Map) {
        address <- map["address"]
        name <- map["name"]
        game <- map["game"]
        portlistShort <- map["portlist_short"]
        folderShort <- map["folder_short"]
        type <- map["type"]
    }
}
