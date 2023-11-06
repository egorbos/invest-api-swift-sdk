/// Лимиты на вывод средств.
public struct WithdrawLimits: Codable {
    /// Валютные позиции портфеля.
    public let money: [MoneyValue]

    /// Заблокированные валютные позиции портфеля.
    public let blocked: [MoneyValue]

    /// Заблокировано под гарантийное обеспечение фьючерсов.
    public let blockedGuarantee: [MoneyValue]
}

internal extension WithdrawLimits {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse) {
        self.money = grpcModel.money.map { $0.toModel() }
        self.blocked = grpcModel.blocked.map { $0.toModel() }
        self.blockedGuarantee = grpcModel.blockedGuarantee.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse {
    func toModel() -> WithdrawLimits {
        WithdrawLimits(grpcModel: self)
    }
}
