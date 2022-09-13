import Foundation

internal struct ApiTarget {
    enum ApiTargetType: String, CaseIterable {
        case common, sandbox
    }
    
    enum Wrapped {
        case common(String, Int)
        case sandbox(String, Int)
    }

    let wrapped: Wrapped
    
    let host: String
    let port: Int
    
    private init(host: String, port: Int, wrapped: Wrapped) {
        self.host = host
        self.port = port
        self.wrapped = wrapped
    }
    
    static func common(_ host: String, port: Int) -> ApiTarget {
        return ApiTarget(host: host, port: port, wrapped: .common(host, port))
    }
    
    static func sandbox(_ host: String, port: Int) -> ApiTarget {
        return ApiTarget(host: host, port: port, wrapped: .sandbox(host, port))
    }
    
    var type: ApiTargetType {
        switch self.wrapped {
        case .common:
            return .common
        case .sandbox:
            return .sandbox
        }
    }
}
