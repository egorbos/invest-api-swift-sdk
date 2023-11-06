import Foundation

/// Виртуальная (подарочная) позиция портфеля.
public struct PortfolioVirtualPosition: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Тип инструмента.
    public let instrumentType: InstrumentType
    
    /// Количество инструмента в портфеле в штуках.
    public let quantity: Quotation
    
    /// Средневзвешенная цена позиции.
    public let averagePositionPrice: MoneyValue
    
    /// Средняя цена позиции по методу FIFO.
    public let averagePositionPriceFifo: MoneyValue
    
    /// Текущая рассчитанная доходность позиции.
    public let expectedYield: Quotation
    
    /// Текущая рассчитанная доходность позиции.
    public let expectedYieldFifo: Quotation
    
    /// Дата до которой нужно продать виртуальные бумаги.
    public let expirationDate: Date
    
    /// Текущая цена за 1 инструмент.
    public let currentPrice: MoneyValue
}

internal extension PortfolioVirtualPosition {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_VirtualPortfolioPosition) {
        self.figi = grpcModel.figi
        self.instrumentType = InstrumentType(rawValue: grpcModel.instrumentType) ?? .unspecified
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
    func toModel() -> PortfolioVirtualPosition {
        PortfolioVirtualPosition(grpcModel: self)
    }
}
