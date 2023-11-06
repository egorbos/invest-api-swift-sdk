import Foundation

/// Позиция портфеля.
public struct PortfolioPosition: Codable {
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
    
    /// Текущая рассчитанная доходность позиции по методу FIFO.
    public let expectedYieldFifo: Quotation
    
    /// Текущий накопленный купонный доход.
    public let accumulatedCouponIncome: MoneyValue
    
    /// Текущая цена за 1 инструмент.
    public let currentPrice: MoneyValue
    
    /// Заблокировано на бирже.
    public let blocked: Bool
    
    /// Вариационная маржа.
    public let variationMargin: MoneyValue
}

internal extension PortfolioPosition {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PortfolioPosition) {
        self.figi = grpcModel.figi
        self.instrumentType = InstrumentType(rawValue: grpcModel.instrumentType) ?? .unspecified
        self.quantity = grpcModel.quantity.toModel()
        self.averagePositionPrice = grpcModel.averagePositionPrice.toModel()
        self.averagePositionPriceFifo = grpcModel.averagePositionPriceFifo.toModel()
        self.expectedYield = grpcModel.expectedYield.toModel()
        self.expectedYieldFifo = grpcModel.expectedYieldFifo.toModel()
        self.accumulatedCouponIncome = grpcModel.currentNkd.toModel()
        self.currentPrice = grpcModel.currentPrice.toModel()
        self.blocked = grpcModel.blocked
        self.variationMargin = grpcModel.varMargin.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioPosition {
    func toModel() -> PortfolioPosition {
        PortfolioPosition(grpcModel: self)
    }
}
