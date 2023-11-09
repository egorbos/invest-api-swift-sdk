import Foundation

/// Список позиций по счёту.
public protocol PositionsCollection {
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
    
    /// Признак выполнения операции выгрузки лимитов.
    var limitsLoadingInProgress: Bool { get }
}

internal struct PositionsCollectionModel: PositionsCollection {
    let money: [MoneyValue]
    
    let blockedMoney: [MoneyValue]
    
    let securities: [PositionElement]
    
    let futures: [PositionElement]
    
    let options: [PositionElement]
    
    let limitsLoadingInProgress: Bool
}

internal extension PositionsCollectionModel {
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
    func toModel() -> PositionsCollectionModel {
        PositionsCollectionModel(grpcModel: self)
    }
}
