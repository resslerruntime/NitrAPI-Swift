import ObjectMapper

/// This class represents a Webspace.
open class Webspace: Service {

    /// Returns name.
    open fileprivate(set) var name: String?
    /// Returns quota.
    open fileprivate(set) var quota: Quota?
    /// Returns domains.
    open fileprivate(set) var domains: [Domain]?

    class WebspaceData : Mappable {
        weak var parent: Webspace!
        init() {
        }

        required init?(map: Map) {
        }

        func mapping(map: Map) {
            parent.name <- map["name"]
            parent.quota <- map["quota"]
            parent.domains <- map["domains"]
        }
    }

    /// This class represents a quota.
    open class Quota: Mappable {
        /// Returns maxSpace.
        open fileprivate(set) var maxSpace: Int?
        /// Returns maxDomains.
        open fileprivate(set) var maxDomains: Int?
        /// Returns maxMailAccounts.
        open fileprivate(set) var maxMailAccounts: Int?
        /// Returns maxFtpAccounts.
        open fileprivate(set) var maxFtpAccounts: Int?
        /// Returns maxDatabases.
        open fileprivate(set) var maxDatabases: Int?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            maxSpace <- map["max_space"]
            maxDomains <- map["max_domains"]
            maxMailAccounts <- map["max_mail_accounts"]
            maxFtpAccounts <- map["max_ftp_accounts"]
            maxDatabases <- map["max_databases"]
        }
    }

    /// This class represents a domain.
    open class Domain: Mappable {
        /// Returns domain.
        open fileprivate(set) var domain: String?
        /// Returns expires.
        open fileprivate(set) var expires: String?
        /// Returns paidUntil.
        open fileprivate(set) var paidUntil: String?
        /// Returns status.
        open fileprivate(set) var status: String?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            domain <- map["domain"]
            expires <- map["expires"]
            paidUntil <- map["paid_until"]
            status <- map["status"]
        }
    }
    open override func refresh() throws {
        let data = try nitrapi.client.dataGet("services/\(id as Int)/webspaces", parameters: [:])
        let datas = WebspaceData()
        datas.parent = self
        Mapper<WebspaceData>().map(JSON: data?["webspace"] as! [String : Any], toObject: datas)
    }

    override func postInit(_ nitrapi: Nitrapi) throws {
        try super.postInit(nitrapi)

        if (status == .ACTIVE) {
            try refresh()
        }
    }
}
