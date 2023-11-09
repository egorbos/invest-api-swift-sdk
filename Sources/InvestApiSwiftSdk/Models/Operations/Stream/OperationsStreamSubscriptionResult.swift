/// Результат подписки.
public protocol OperationsStreamSubscriptionResult {
    /// Идентификатор счёта.
    var accountId: String { get }
    
    /// Статус подписки.
    var status: OperationsStreamSubscriptionStatus { get }
}

internal struct OperationsStreamSubscriptionResultModel: OperationsStreamSubscriptionResult {
    let accountId: String
    
    let status: OperationsStreamSubscriptionStatus
}

internal extension OperationsStreamSubscriptionResultModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AccountSubscriptionStatus) {
        self.init(
            accountId: grpcModel.accountID,
            status: OperationsStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
    
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionsSubscriptionStatus) {
        self.init(
            accountId: grpcModel.accountID,
            status: OperationsStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AccountSubscriptionStatus {
    func toModel() -> OperationsStreamSubscriptionResultModel {
        OperationsStreamSubscriptionResultModel(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsSubscriptionStatus {
    func toModel() -> OperationsStreamSubscriptionResultModel {
        OperationsStreamSubscriptionResultModel(grpcModel: self)
    }
}
