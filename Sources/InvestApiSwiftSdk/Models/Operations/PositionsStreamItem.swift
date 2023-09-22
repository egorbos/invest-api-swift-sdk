import Foundation

/// Данные о позиции портфеля.
public struct PositionsStreamItem: Codable {
    /// Идентификатор счёта пользователя.
    let accountId: String
    
    /// Валютные позиции портфеля.
    let money: [MoneyValue]
    
    /// Заблокированные валютные позиции портфеля.
    let blockedMoney: [MoneyValue]
    
    /// Открытые позиции ценных бумаг.
    let securities: [PositionElement]
    
    /// Открытые  позиции фьючерсов.
    let futures: [PositionElement]
    
    /// Открытые позиции опционов.
    let options: [PositionElement]
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
    
    init() {
        self.init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionData())
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionData {
    func toModel() -> PositionsStreamItem {
        PositionsStreamItem(grpcModel: self)
    }
}
