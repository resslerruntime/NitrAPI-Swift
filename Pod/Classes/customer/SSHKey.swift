import ObjectMapper

/// This class represents a SSHKey.
open class SSHKey: Mappable {

    /// Returns id.
    open fileprivate(set) var id: Int?
    /// Returns type.
    open fileprivate(set) var type: String?
    /// Returns publicKey.
    open fileprivate(set) var publicKey: String?
    /// Returns comment.
    open fileprivate(set) var comment: String?
    /// Returns enabled.
    open fileprivate(set) var enabled: Bool?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        publicKey <- map["public_key"]
        comment <- map["comment"]
        enabled <- map["enabled"]
    }

    /// Returns the full SSH public key.
    /// - returns: the full SSH public key
    open func getFullPublicKey() throws -> String? {
        return "\(type) \(publicKey) \(comment)"
    }
}
