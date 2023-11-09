import Foundation

/// Позиция портфеля.
public protocol PortfolioPosition {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Тип инструмента.
    var instrumentType: InstrumentType { get }
    
    /// Количество инструмента в портфеле в штуках.
    var quantity: Quotation { get }
    
    /// Средневзвешенная цена позиции.
    var averagePositionPrice: MoneyValue { get }
    
    /// Средняя цена позиции по методу FIFO.
    var averagePositionPriceFifo: MoneyValue { get }
    
    /// Текущая рассчитанная доходность позиции.
    var expectedYield: Quotation { get }
    
    /// Текущая рассчитанная доходность позиции по методу FIFO.
    var expectedYieldFifo: Quotation { get }
    
    /// Текущий накопленный купонный доход.
    var accumulatedCouponIncome: MoneyValue { get }
    
    /// Текущая цена за 1 инструмент.
    var currentPrice: MoneyValue { get }
    
    /// Заблокировано на бирже.
    var blocked: Bool { get }
    
    /// Вариационная маржа.
    var variationMargin: MoneyValue { get }
}

internal struct PortfolioPositionModel: PortfolioPosition {
    let figi: String
    
    let instrumentType: InstrumentType
    
    let quantity: Quotation
    
    let averagePositionPrice: MoneyValue
    
    let averagePositionPriceFifo: MoneyValue
    
    let expectedYield: Quotation
    
    let expectedYieldFifo: Quotation
    
    let accumulatedCouponIncome: MoneyValue
    
    let currentPrice: MoneyValue
    
    let blocked: Bool
    
    let variationMargin: MoneyValue
}

internal extension PortfolioPositionModel {
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
    func toModel() -> PortfolioPositionModel {
        PortfolioPositionModel(grpcModel: self)
    }
}
