import Foundation

/// Виртуальная (подарочная) позиция портфеля.
public struct PortfolioVirtualPosition: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Тип инструмента.
    let instrumentType: InstrumentType
    
    /// Количество инструмента в портфеле в штуках.
    let quantity: Quotation
    
    /// Средневзвешенная цена позиции.
    let averagePositionPrice: MoneyValue
    
    /// Средняя цена позиции по методу FIFO.
    let averagePositionPriceFifo: MoneyValue
    
    /// Текущая рассчитанная доходность позиции.
    let expectedYield: Quotation
    
    /// Текущая рассчитанная доходность позиции.
    let expectedYieldFifo: Quotation
    
    /// Дата до которой нужно продать виртуальные бумаги.
    let expirationDate: Date
    
    /// Текущая цена за 1 инструмент.
    let currentPrice: MoneyValue
}

internal extension PortfolioVirtualPosition {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_VirtualPortfolioPosition) throws {
        self.figi = grpcModel.figi
        self.instrumentType = try .new(rawValue: grpcModel.instrumentType)
        self.quantity = grpcModel.quantity.toModel()
        self.averagePositionPrice = grpcModel.averagePositionPrice.toModel()
        self.averagePositionPriceFifo = grpcModel.averagePositionPriceFifo.toModel()
        self.expectedYield = grpcModel.expectedYield.toModel()
        self.expectedYieldFifo = grpcModel.expectedYieldFifo.toModel()
        self.expirationDate = grpcModel.expireDate.date
        self.currentPrice = grpcModel.currentPrice.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_VirtualPortfolioPosition {
    func toModel() throws -> PortfolioVirtualPosition {
        try PortfolioVirtualPosition(grpcModel: self)
    }
}
