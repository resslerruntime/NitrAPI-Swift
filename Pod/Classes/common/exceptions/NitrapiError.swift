public enum NitrapiError: Error {
    case nitrapiException(message: String)
    case httpException(statusCode: Int)
}
