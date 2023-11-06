import Foundation

/// Данные о позиции портфеля.
public struct PositionsStreamItem: Codable {
    /// Идентификатор счёта пользователя.
    public let accountId: String
    
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
}

internal extension PositionsStreamItem {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionData) {
        self.accountId = grpcModel.accountID
        self.money = grpcModel.money
            .map { $0.availableValue }
            .map { $0.toModel() }
        self.blockedMoney = grpcModel.money
            .map { $0.blockedValue }
            .map { $0.toModel() }
        self.securities = grpcModel.securities.map { $0.toModel() }
        self.futures = grpcModel.futures.map { $0.toModel() }
        self.options = grpcModel.options.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionData {
    func toModel() -> PositionsStreamItem {
        PositionsStreamItem(grpcModel: self)
    }
}
