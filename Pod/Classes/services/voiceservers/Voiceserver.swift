import ObjectMapper

/// This class represents a Voiceserver.
open class Voiceserver: Service {

    public class VoiceserverType: Value, CustomStringConvertible {
        public static let TEAMSPEAK3 = VoiceserverType("teamspeak3")

        public static let MUMBLE = VoiceserverType("mumble")

        public static let VENTRILO = VoiceserverType("ventrilo")
        public var description: String {
            return value
        }
    }

    /// Returns voiceserverType.
    open fileprivate(set) var voiceserverType: VoiceserverType?
    /// Returns ip.
    open fileprivate(set) var ip: String?
    /// Returns port.
    open fileprivate(set) var port: Int?
    /// Returns slots.
    open fileprivate(set) var slots: Int?
    /// Returns started.
    open fileprivate(set) var started: Bool?

    class VoiceserverData : Mappable {
        weak var parent: Voiceserver!
        init() {
        }

        required init?(map: Map) {
        }

        func mapping(map: Map) {
            parent.voiceserverType <- (map["type"], ValueTransform<VoiceserverType>())
            parent.ip <- map["ip"]
            parent.port <- map["port"]
            parent.slots <- map["slots"]
            parent.started <- map["started"]
        }
    }

    /// Restarts the voiceserver.
    /// needs permission ROLE_WEBINTERFACE_GENERAL_CONTROL
    open func doRestart() throws {
        _ = try nitrapi.client.dataPost("services/\(id as Int)/voiceservers/restart", parameters: [:])
    }

    /// Stopps the voiceserver. Notice: Not supported by Mumble.
    /// needs permission ROLE_WEBINTERFACE_GENERAL_CONTROL
    open func doStop() throws {
        _ = try nitrapi.client.dataPost("services/\(id as Int)/voiceservers/stop", parameters: [:])
    }

    /// Reinstalls the voiceserver.
    /// needs permission ROLE_WEBINTERFACE_GENERAL_CONTROL
    open func reinstall() throws {
        _ = try nitrapi.client.dataPost("services/\(id as Int)/voiceservers/reinstall", parameters: [:])
    }

    open override func refresh() throws {
        let data = try nitrapi.client.dataGet("services/\(id as Int)/voiceservers", parameters: [:])
        let datas = VoiceserverData()
        datas.parent = self
        Mapper<VoiceserverData>().map(JSON: data?["voiceserver"] as! [String : Any], toObject: datas)
    }

    override func postInit(_ nitrapi: Nitrapi) throws {
        try super.postInit(nitrapi)

        if (status == .ACTIVE) {
            try refresh()
        }
    }
}
