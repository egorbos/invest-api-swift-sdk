/// Результат подписки.
public struct OperationsStreamSubscriptionResult: Codable {
    /// Идентификатор счёта.
    let accountId: String
    
    /// Статус подписки.
    let status: OperationsStreamSubscriptionStatus
}

internal extension OperationsStreamSubscriptionResult {
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
    func toModel() -> OperationsStreamSubscriptionResult {
        OperationsStreamSubscriptionResult(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsSubscriptionStatus {
    func toModel() -> OperationsStreamSubscriptionResult {
        OperationsStreamSubscriptionResult(grpcModel: self)
    }
}
