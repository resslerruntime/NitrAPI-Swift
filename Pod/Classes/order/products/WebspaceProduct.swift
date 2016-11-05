
open class WebspaceProduct: PartPricing {
    public override init(nitrapi: Nitrapi, locationId: Int) {
        super.init(nitrapi: nitrapi, locationId: locationId)
        product = "webspace"
    }
}
