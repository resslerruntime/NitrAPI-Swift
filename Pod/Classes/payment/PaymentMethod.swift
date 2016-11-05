import ObjectMapper

open class PaymentMethod: Mappable, CustomStringConvertible {
    // MARK: - Attributes
    open var id: String!
    open fileprivate(set) var name: String?
    open fileprivate(set) var minAmount: Int?
    open fileprivate(set) var maxAmount: Int?
    open fileprivate(set) var tariffs: [Int]?
    open fileprivate(set) var countries: [String]?
    open fileprivate(set) var banks: [String: String]?
    
    // MARK: - Initialization
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        name        <- map["name"]
        minAmount   <- map["min_amount"]
        maxAmount   <- map["max_amount"]
        tariffs     <- map["tariffs"]
        countries   <- map["countries"]
        banks       <- map["banks"]
    }
    open var description: String {
        return name ?? ""
    }
}
