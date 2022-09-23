import Foundation

/// Лимиты на вывод средств.
public struct WithdrawLimits: Codable {
    /// Валютные позиции портфеля.
    let money: [MoneyValue]

    /// Заблокированные валютные позиции портфеля.
    let blocked: [MoneyValue]

    /// Заблокировано под гарантийное обеспечение фьючерсов.
    let blockedGuarantee: [MoneyValue]
}

internal extension WithdrawLimits {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse) {
        self.money = grpcModel.money.map({ money in money.toModel() })
        self.blocked = grpcModel.blocked.map({ money in money.toModel() })
        self.blockedGuarantee = grpcModel.blockedGuarantee.map({ money in money.toModel() })
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse {
    func toModel() -> WithdrawLimits {
        WithdrawLimits(grpcModel: self)
    }
}
