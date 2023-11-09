import Foundation

/// Данные о позиции портфеля.
public protocol PositionsStreamItem {
    /// Идентификатор счёта пользователя.
    var accountId: String { get }
    
    /// Валютные позиции портфеля.
    var money: [MoneyValue] { get }
    
    /// Заблокированные валютные позиции портфеля.
    var blockedMoney: [MoneyValue] { get }
    
    /// Открытые позиции ценных бумаг.
    var securities: [PositionElement] { get }
    
    /// Открытые  позиции фьючерсов.
    var futures: [PositionElement] { get }
    
    /// Открытые позиции опционов.
    var options: [PositionElement] { get }
}

internal struct PositionsStreamItemModel: PositionsStreamItem {
    let accountId: String
    
    let money: [MoneyValue]
    
    let blockedMoney: [MoneyValue]
    
    let securities: [PositionElement]
    
    let futures: [PositionElement]
    
    let options: [PositionElement]
}

internal extension PositionsStreamItemModel {
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
    func toModel() -> PositionsStreamItemModel {
        PositionsStreamItemModel(grpcModel: self)
    }
}
