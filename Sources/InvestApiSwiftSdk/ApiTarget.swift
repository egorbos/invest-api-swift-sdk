import Foundation

enum ApiTargetType: String, CaseIterable {
    case common, sandbox
}

public struct ApiTarget {
    internal enum Wrapped {
        case common(String, Int)
        case sandbox(String, Int)
    }

    internal let wrapped: Wrapped
    
    public let host: String
    public let port: Int
    
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
