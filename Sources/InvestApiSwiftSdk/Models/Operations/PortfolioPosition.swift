import Foundation

/// Позиция портфеля.
public struct PortfolioPosition: Codable {
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
    
    /// Текущая рассчитанная доходность позиции по методу FIFO.
    let expectedYieldFifo: Quotation
    
    /// Текущий накопленный купонный доход.
    let accumulatedCouponIncome: MoneyValue
    
    /// Текущая цена за 1 инструмент.
    let currentPrice: MoneyValue
    
    /// Заблокировано на бирже.
    let blocked: Bool
    
    /// Вариационная маржа.
    let variationMargin: MoneyValue
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
