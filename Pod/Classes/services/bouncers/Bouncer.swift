import ObjectMapper

/// This class represents a Bouncer.
open class Bouncer: Service {

    /// Returns maximum amount of bouncers.
    open fileprivate(set) var maxBouncer: Int?
    /// Returns bouncerType.
    open fileprivate(set) var bouncerType: String?
    /// Returns bouncer instances.
    open fileprivate(set) var bouncers: [BouncerInstance]?

    class BouncerData : Mappable {
        weak var parent: Bouncer!
        init() {
        }

        required init?(map: Map) {
        }

        func mapping(map: Map) {
            parent.maxBouncer <- map["max_bouncer"]
            parent.bouncerType <- map["type"]
            parent.bouncers <- map["bouncers"]
        }
    }

    /// Creates a new ident
    /// - parameter ident: Set the ident. Allowed /^[A-Za-z0-9]+$/.
    /// - parameter password: A password for the ident
    open func addIdent(_ ident: String, password: String) throws {
        _ = try nitrapi.client.dataPost("services/\(id as Int)/bouncers/", parameters: [
           "ident": ident,
           "password": password
        ])
    }

    /// Deletes an ident
    /// - parameter ident: Name of the ident which will be deleted
    open func deleteIdent(_ ident: String) throws {
        _ = try nitrapi.client.dataDelete("services/\(id as Int)/bouncers/", parameters: [
           "ident": ident
        ])
    }

    /// Changes the password for an ident
    /// - parameter ident: ident
    /// - parameter password: a new password
    open func editPassword(_ ident: String, password: String) throws {
        _ = try nitrapi.client.dataPut("services/\(id as Int)/bouncers/", parameters: [
           "ident": ident,
           "password": password
        ])
    }

    open override func refresh() throws {
        let data = try nitrapi.client.dataGet("services/\(id as Int)/bouncers", parameters: [:])
        let datas = BouncerData()
        datas.parent = self
        Mapper<BouncerData>().map(JSON: data?["bouncer"] as! [String : Any], toObject: datas)
    }

    override func postInit(_ nitrapi: Nitrapi) throws {
        try super.postInit(nitrapi)

        if (status == .ACTIVE) {
            try refresh()
        }
    }
}
