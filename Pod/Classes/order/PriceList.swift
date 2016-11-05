import ObjectMapper

open class PriceList: Mappable {
    
    open fileprivate(set) var advice: Int!
    
    open fileprivate(set) var rentalTimes: [Int]!
    
    // for part pricing
    open fileprivate(set) var parts: [Part]?
    
    // for dimension pricing
    open fileprivate(set) var dimensions: [Dimension]?
    open fileprivate(set) var prices: [String: DimensionValue]?
    
    // MARK: - Initialization
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        rentalTimes <- map["rental_times"]
        parts       <- map["parts"]
        advice      <- map["advice"]
        dimensions  <- map["dimensions"]
        prices      <- (map["prices"], DimensionValuesTransform())
    }
}
