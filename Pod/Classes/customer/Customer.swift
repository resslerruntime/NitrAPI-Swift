import ObjectMapper

/// Details of the current customer.
open class Customer: Mappable {
    fileprivate var nitrapi: Nitrapi!

    /// Returns the id of this user.
    open fileprivate(set) var userId: Int!
    /// Returns the username.
    open fileprivate(set) var username: String!
    /// Returns true if the user is activated.
    open fileprivate(set) var activated: Bool?
    /// Returns the timezone of this user.
    open fileprivate(set) var timezone: String?
    /// Returns the email address of this user.
    open fileprivate(set) var email: String?
    /// Returns the credit of this user.
    open fileprivate(set) var credit: Int?
    /// Returns the currency the user paid.
    open fileprivate(set) var currency: String?
    /// Returns the date the user registered.
    open fileprivate(set) var registered: Date?
    /// Returns language.
    open fileprivate(set) var language: String?
    /// Returns the url of the avatar.
    open fileprivate(set) var avatar: String?
    /// Returns true if donations are enabled.
    open fileprivate(set) var donations: Bool?
    /// Returns phone.
    open fileprivate(set) var phone: Phone?
    /// Returns activated two factor authentication methods.
    open fileprivate(set) var twoFactor: [String]?
    /// Returns personal details of the user.
    open fileprivate(set) var profile: [String: String]?

    init() {
    }

    required public init?(map: Map) {
    }

    public func mapping(map: Map) {
        userId <- map["user_id"]
        username <- map["username"]
        activated <- map["activated"]
        timezone <- map["timezone"]
        email <- map["email"]
        credit <- map["credit"]
        currency <- map["currency"]
        registered <- (map["registered"], Nitrapi.dft)
        language <- map["language"]
        avatar <- map["avatar"]
        donations <- map["donations"]
        phone <- map["phone"]
        twoFactor <- map["two_factor"]
        profile <- map["profile"]
    }

    /// This class represents a phone.
    open class Phone: Mappable {
        /// Returns phonenumber of the user.
        open fileprivate(set) var number: String?
        /// Returns countryCode.
        open fileprivate(set) var countryCode: String?
        /// Returns true if this number is verified.
        open fileprivate(set) var verified: Bool?

        init() {
        }

        required public init?(map: Map) {
        }

        public func mapping(map: Map) {
            number <- map["number"]
            countryCode <- map["country_code"]
            verified <- map["verified"]
        }
    }

    /// - returns: AccountOverview
    open func getAccountOverview() throws -> AccountOverview? {
        let data = try nitrapi.client.dataGet("user/account_overview", parameters: [:])

        let account_overview = Mapper<AccountOverview>().map(JSON: data?["account_overview"] as! [String : Any])
        return account_overview
    }


    /// - parameter year: year
    /// - parameter month: month
    /// - returns: AccountOverview
    open func getAccountOverview(_ year: Int, month: Int) throws -> AccountOverview? {
        let data = try nitrapi.client.dataGet("user/account_overview", parameters: [
           "year": year,
           "month": month
        ])

        let account_overview = Mapper<AccountOverview>().map(JSON: data?["account_overview"] as! [String : Any])
        return account_overview
    }

    /// Request user update token.
    /// - parameter password: The current user password.
    /// - returns: String
    open func requestUserUpdateToken(_ password: String) throws -> String? {
        let data = try nitrapi.client.dataPost("user/token", parameters: [
           "password": password
        ])

        let token = data?["token"] as? String
        return token
    }

    /// Add phone number.
    /// - parameter number: phone number with country code
    /// - parameter token: the update token of the current user
    open func addPhoneNumber(_ number: String, token: String) throws {
        _ = try nitrapi.client.dataPost("user/phone", parameters: [
           "number": number,
           "token": token
        ])
    }

    /// Delete phone number.
    /// - parameter token: the update token of the current user
    open func deletePhoneNumber(_ token: String) throws {
        _ = try nitrapi.client.dataDelete("user/phone", parameters: [
           "token": token
        ])
    }

    /// Verify phone number.
    /// - parameter code: Verification code from SMS
    open func verifyPhoneNumber(_ code: String) throws {
        _ = try nitrapi.client.dataPost("user/phone/verify", parameters: [
           "code": code
        ])
    }

    /// Updates the timezone of the user.
    /// - parameter timezone: new timezone for the user
    /// - parameter token: the update token of the current user
    open func updateTimezone(_ timezone: String, token: String) throws {
        _ = try nitrapi.client.dataPost("user/", parameters: [
           "timezone": timezone,
           "token": token
        ])
    }

    /// Updates the profile information.
    /// - parameter token: the update token of the current user
    /// - parameter name: name
    /// - parameter street: street
    /// - parameter postcode: postcode
    /// - parameter city: city
    /// - parameter country: country
    /// - parameter state: state
    open func updateProfile(_ token: String, name: String?, street: String?, postcode: String?, city: String?, country: String?, state: String?) throws {
        _ = try nitrapi.client.dataPost("user/", parameters: [
           "token": token,
           "profile[name]": name,
           "profile[street]": street,
           "profile[postcode]": postcode,
           "profile[city]": city,
           "profile[country]": country,
           "profile[state]": state
        ])
    }

    /// Updates the password.
    /// - parameter password: the new password
    /// - parameter token: The update token of the current user
    open func updatePassword(_ password: String, token: String) throws {
        _ = try nitrapi.client.dataPost("user/", parameters: [
           "password": password,
           "token": token
        ])
    }

    /// Updates the donation setting.
    /// - parameter donations: true if donations can be received
    /// - parameter token: The update token of the current user
    open func updateDonations(_ donations: Bool, token: String) throws {
        _ = try nitrapi.client.dataPost("user/", parameters: [
           "donations": donations,
           "token": token
        ])
    }

    // MARK: - Internally used
    func postInit(_ nitrapi: Nitrapi) {
        self.nitrapi = nitrapi
    }
}
