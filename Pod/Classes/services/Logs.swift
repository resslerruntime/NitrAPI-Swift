import ObjectMapper

/// This class represents log entries for a gameserver that are split up in pages. <p> Use Gameserver.getLogs(page) to get a certain page
open class Logs: Mappable {

    /// Returns the number of the current page.
    open fileprivate(set) var currentPage: Int?
    /// Returns the number of logs on a page.
    open fileprivate(set) var logsPerPage: Int?
    /// Returns the number of pages in this logs.
    open fileprivate(set) var pageCount: Int?
    /// Returns the total number of log entries.
    open fileprivate(set) var logCount: Int?
    /// Returns the log entries on the current page.
    open fileprivate(set) var logs: [LogEntry]?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        currentPage <- map["current_page"]
        logsPerPage <- map["logs_per_page"]
        pageCount <- map["page_count"]
        logCount <- map["log_count"]
        logs <- map["logs"]
    }

    /// This class represents an entry in the server log.
    open class LogEntry: Mappable {
        /// Returns the user.
        open fileprivate(set) var user: String?
        /// Returns the category.
        open fileprivate(set) var category: String?
        /// Returns the message.
        open fileprivate(set) var message: String?
        /// Returns the date this entry was created.
        open fileprivate(set) var createdAt: Date?
        /// Returns admin.
        open fileprivate(set) var admin: Bool?
        /// Returns ip.
        open fileprivate(set) var ip: String?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            user <- map["user"]
            category <- map["category"]
            message <- map["message"]
            createdAt <- (map["created_at"], Nitrapi.dft)
            admin <- map["admin"]
            ip <- map["ip"]
        }
    }
}
