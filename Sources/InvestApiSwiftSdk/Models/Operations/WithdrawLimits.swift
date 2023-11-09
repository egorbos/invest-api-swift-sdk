/// Лимиты на вывод средств.
public protocol WithdrawLimits {
    /// Валютные позиции портфеля.
    var money: [MoneyValue] { get }

    /// Заблокированные валютные позиции портфеля.
    var blocked: [MoneyValue] { get }

    /// Заблокировано под гарантийное обеспечение фьючерсов.
    var blockedGuarantee: [MoneyValue] { get }
}

internal struct WithdrawLimitsModel: WithdrawLimits {
    let money: [MoneyValue]
    
    let blocked: [MoneyValue]
    
    let blockedGuarantee: [MoneyValue]
}

internal extension WithdrawLimitsModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse) {
        self.money = grpcModel.money.map { $0.toModel() }
        self.blocked = grpcModel.blocked.map { $0.toModel() }
        self.blockedGuarantee = grpcModel.blockedGuarantee.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse {
    func toModel() -> WithdrawLimitsModel {
        WithdrawLimitsModel(grpcModel: self)
    }
}
