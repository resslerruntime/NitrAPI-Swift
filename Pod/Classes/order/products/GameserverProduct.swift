
open class GameserverProduct: DimensionPricing {
    public override init(nitrapi: Nitrapi, locationId: Int) {
        super.init(nitrapi: nitrapi, locationId: locationId)
        product = "gameserver"
        additionals["game"] = "sevendtd"
    }
    
    open func setGame(_ game: String) {
        additionals["game"] = game
    }
}
