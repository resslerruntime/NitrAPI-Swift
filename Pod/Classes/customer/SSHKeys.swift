import ObjectMapper

/// This class represents a SSHKeys.
open class SSHKeys: Mappable {
    fileprivate var nitrapi: Nitrapi!

    /// Returns keys.
    open fileprivate(set) var keys: [SSHKey]?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        keys <- map["keys"]
    }

    /// Upload a SSH key.
    /// - parameter key: key
    open func uploadKey(_ key: String) throws {
        _ = try nitrapi.client.dataPost("user/ssh_keys/", parameters: [
           "key": key
        ])
    }

    /// Updates a SSH public key.
    /// - parameter id: id
    /// - parameter key: key
    /// - parameter enabled: enabled
    open func updateKey(_ id: Int, key: String, enabled: Bool) throws {
        _ = try nitrapi.client.dataPost("user/ssh_keys/\(id)", parameters: [
           "key": key,
           "enabled": enabled
        ])
    }

    /// Deletes a SSH public key.
    /// - parameter id: id
    open func deleteKey(_ id: Int) throws {
        _ = try nitrapi.client.dataDelete("user/ssh_keys/\(id)", parameters: [:])
    }

    // MARK: - Internally used
    func postInit(_ nitrapi: Nitrapi) {
        self.nitrapi = nitrapi
    }
}
