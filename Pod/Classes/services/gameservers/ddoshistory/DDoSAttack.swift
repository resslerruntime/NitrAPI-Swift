import ObjectMapper

/// This class represents a DDoSAttack.
open class DDoSAttack: Mappable {

    /// Returns the id of this DDoS-attack.
    open fileprivate(set) var id: Int?
    /// Returns the start date of this DDoS-attack.
    open fileprivate(set) var startedAt: Date?
    /// Returns the end date of this DDoS-attack.
    open fileprivate(set) var endedAt: Date?
    /// Returns the attack type  of this DDoS-attack.
    open fileprivate(set) var attackType: String?
    /// Returns the ip that was attacked.
    open fileprivate(set) var ip: String?
    /// Returns the name of the server that was attacked.
    open fileprivate(set) var server: String?
    /// Returns the average packets-per-second of this DDoS-attack.
    open fileprivate(set) var pps: Int?
    /// Returns the average bandwidth of this DDoS-attack.
    open fileprivate(set) var bandwidth: Int?
    /// Returns the duration of this DDoS-attack.
    open fileprivate(set) var duration: Int?
    /// Returns datailed statistics of this DDoS-attack.
    open fileprivate(set) var data: [DDoSStat]?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        id <- map["id"]
        startedAt <- (map["started_at"], Nitrapi.dft)
        endedAt <- (map["ended_at"], Nitrapi.dft)
        attackType <- map["attack_type"]
        ip <- map["ip"]
        server <- map["server"]
        pps <- map["pps"]
        bandwidth <- map["bandwidth"]
        duration <- map["duration"]
        data <- map["data"]
    }
}
