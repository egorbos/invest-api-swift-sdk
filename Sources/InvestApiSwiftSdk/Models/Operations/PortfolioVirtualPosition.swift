import Foundation

/// Виртуальная (подарочная) позиция портфеля.
public protocol PortfolioVirtualPosition {
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
    
    /// Текущая рассчитанная доходность позиции.
    var expectedYieldFifo: Quotation { get }
    
    /// Дата до которой нужно продать виртуальные бумаги.
    var expirationDate: Date { get }
    
    /// Текущая цена за 1 инструмент.
    var currentPrice: MoneyValue { get }
}

internal struct PortfolioVirtualPositionModel: PortfolioVirtualPosition {
    let figi: String
    
    let instrumentType: InstrumentType
    
    let quantity: Quotation
    
    let averagePositionPrice: MoneyValue
    
    let averagePositionPriceFifo: MoneyValue
    
    let expectedYield: Quotation
    
    let expectedYieldFifo: Quotation
    
    let expirationDate: Date
    
    let currentPrice: MoneyValue
}

internal extension PortfolioVirtualPositionModel {
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
    func toModel() -> PortfolioVirtualPositionModel {
        PortfolioVirtualPositionModel(grpcModel: self)
    }
}
