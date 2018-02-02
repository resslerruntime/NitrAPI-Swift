import ObjectMapper

/// This class represents a datapoint of a DDoS-attack statistic.
open class DDoSStat: Mappable {

    /// Returns the date of this datapoint.
    open fileprivate(set) var datetime: Date?
    /// Returns the packets-per-second at this datapoint.
    open fileprivate(set) var pps: Int?
    /// Returns the bandwidth at this datapoint.
    open fileprivate(set) var bandwidth: Int?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        datetime <- (map["datetime"], Nitrapi.dft)
        pps <- map["pps"]
        bandwidth <- map["bandwidth"]
    }
}
