import ObjectMapper

/// This class represents a BouncerInstance.
open class BouncerInstance: Mappable {

    /// Returns ident.
    open fileprivate(set) var ident: String?
    /// Returns password.
    open fileprivate(set) var password: String?
    /// Returns comment.
    open fileprivate(set) var comment: String?
    /// Returns bouncerServer.
    open fileprivate(set) var bouncerServer: BouncerServer?
    /// Returns runningTasks.
    open fileprivate(set) var runningTasks: Bool?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        ident <- map["ident"]
        password <- map["password"]
        comment <- map["comment"]
        bouncerServer <- map["server"]
        runningTasks <- map["running_tasks"]
    }

    /// This class represents the server this bouncers is on.
    open class BouncerServer: Mappable {
        /// Returns name.
        open fileprivate(set) var name: String?
        /// Returns port.
        open fileprivate(set) var port: Int?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            name <- map["name"]
            port <- map["port"]
        }
    }
}
