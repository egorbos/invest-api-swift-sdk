import Foundation

/// Список позиций по счёту.
public struct PositionsCollection: Codable {
    /// Валютные позиции портфеля.
    public let money: [MoneyValue]
    
    /// Заблокированные валютные позиции портфеля.
    public let blockedMoney: [MoneyValue]
    
    /// Открытые позиции ценных бумаг.
    public let securities: [PositionElement]
    
    /// Открытые  позиции фьючерсов.
    public let futures: [PositionElement]
    
    /// Открытые позиции опционов.
    public let options: [PositionElement]
    
    /// Признак выполнения операции выгрузки лимитов.
    public let limitsLoadingInProgress: Bool
}

internal extension PositionsCollection {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionsResponse) {
        self.money = grpcModel.money.map { $0.toModel() }
        self.blockedMoney = grpcModel.blocked.map { $0.toModel() }
        self.securities = grpcModel.securities.map { $0.toModel() }
        self.futures = grpcModel.futures.map { $0.toModel() }
        self.options = grpcModel.options.map { $0.toModel() }
        self.limitsLoadingInProgress = grpcModel.limitsLoadingInProgress
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsResponse {
    func toModel() -> PositionsCollection {
        PositionsCollection(grpcModel: self)
    }
}
