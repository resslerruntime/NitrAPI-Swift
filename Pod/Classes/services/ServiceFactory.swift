import ObjectMapper

internal func createService(_ data: NSDictionary) throws -> Service? {
    var service: Service? = nil
    if let type = data["type"] as? String {
        // no fancy reflection hacks I know in swift, so we have to define this for every new service type...
        switch type {
        case "bouncer":
            service = Mapper<Bouncer>().map(JSON: data as! [String : Any])
        case "clanpage":
            service = Mapper<Clanpage>().map(JSON: data as! [String : Any])
        case "cloud_server":
            service = Mapper<CloudServer>().map(JSON: data as! [String : Any])
        case "gameserver":
            service = Mapper<Gameserver>().map(JSON: data as! [String : Any])
        case "rootserver":
            service = Mapper<Rootserver>().map(JSON: data as! [String : Any])
        case "storage":
            service = Mapper<Storage>().map(JSON: data as! [String : Any])
        case "voiceserver":
            service = Mapper<Voiceserver>().map(JSON: data as! [String : Any])
        case "webspace":
            service = Mapper<Webspace>().map(JSON: data as! [String : Any])
        default:
            print("Type \(type) not known!")
            service = Mapper<Service>().map(JSON: data as! [String : Any])
        }
        
    }
    
    return service
}
