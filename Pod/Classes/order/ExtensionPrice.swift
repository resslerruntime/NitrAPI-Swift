 import ObjectMapper
 
 open class ExtensionPrice {
    open fileprivate(set) var rentalTime: Int!
    open fileprivate(set) var price: Int!
    
    // MARK: - Initialization
    public required init?(rentalTime: Int, price: Int) {
        self.rentalTime = rentalTime
        self.price = price
    }
 }
  
