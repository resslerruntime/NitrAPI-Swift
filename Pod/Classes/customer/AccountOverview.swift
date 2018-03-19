import ObjectMapper

/// This class represents an AccountOverview.
open class AccountOverview: Mappable {

    public class IncOrDec: Value, CustomStringConvertible {
        public static let INCREASE = IncOrDec("increase")

        public static let DECREASE = IncOrDec("decrease")
        public var description: String {
            return value
        }
    }

    /// Returns from.
    open fileprivate(set) var from: Date?
    /// Returns end.
    open fileprivate(set) var end: Date?
    /// Returns payments.
    open fileprivate(set) var payments: [Payment]?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        from <- (map["from"], Nitrapi.dft)
        end <- (map["end"], Nitrapi.dft)
        payments <- map["payments"]
    }

    /// This class represents a donation.
    open class Donation: Mappable {
        /// Returns senderUserId.
        open fileprivate(set) var senderUserId: Int?
        /// Returns receiverUserId.
        open fileprivate(set) var receiverUserId: Int?
        /// Returns subject.
        open fileprivate(set) var subject: String?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            senderUserId <- map["sender_user_id"]
            receiverUserId <- map["receiver_user_id"]
            subject <- map["subject"]
        }
    }

    /// This class represents a Payment.
    open class Payment: Mappable {
        /// Returns id.
        open fileprivate(set) var id: Int?
        /// Returns invoiceId.
        open fileprivate(set) var invoiceId: String?
        /// Returns serviceId.
        open fileprivate(set) var serviceId: Int?
        /// Returns switchedServiceId.
        open fileprivate(set) var switchedServiceId: Int?
        /// Returns donation.
        open fileprivate(set) var donation: Donation?
        /// Returns date.
        open fileprivate(set) var date: Date?
        /// Returns method.
        open fileprivate(set) var method: String?
        /// Returns duration.
        open fileprivate(set) var duration: Int?
        /// Returns amount.
        open fileprivate(set) var amount: Int?
        /// Returns incOrDec.
        open fileprivate(set) var incOrDec: IncOrDec?
        /// Returns currency.
        open fileprivate(set) var currency: String?
        /// Returns ip.
        open fileprivate(set) var ip: String?
        /// Returns refundable.
        open fileprivate(set) var refundable: Bool?
        /// Returns providerFee.
        open fileprivate(set) var providerFee: Int?
        /// Returns lastStatus.
        open fileprivate(set) var lastStatus: String?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            id <- map["id"]
            invoiceId <- map["invoice_id"]
            serviceId <- map["service_id"]
            switchedServiceId <- map["switched_service_id"]
            donation <- map["donation"]
            date <- (map["date"], Nitrapi.dft)
            method <- map["method"]
            duration <- map["duration"]
            amount <- map["amount"]
            incOrDec <- (map["type"], ValueTransform<IncOrDec>())
            currency <- map["currency"]
            ip <- map["ip"]
            refundable <- map["refundable"]
            providerFee <- map["provider_fee"]
            lastStatus <- map["last_status"]
        }
    }
}
