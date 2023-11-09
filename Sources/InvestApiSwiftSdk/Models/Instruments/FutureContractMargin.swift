///  Размер гарантийного обеспечения по фьючерсному контракту.
public protocol FutureContractMargin {
    /// Гарантийное обеспечение при покупке.
    var initialMarginOnBuy: MoneyValue { get }
    
    /// Гарантийное обеспечение при продаже.
    var initialMarginOnSell: MoneyValue { get }
    
    /// Шаг цены.
    var minPriceIncrement: Quotation { get }
    
    /// Стоимость шага цены.
    var minPriceIncrementAmount: Quotation { get }
}

internal struct FutureContractMarginModel: FutureContractMargin {
    let initialMarginOnBuy: MoneyValue
    
    let initialMarginOnSell: MoneyValue
    
    let minPriceIncrement: Quotation
    
    let minPriceIncrementAmount: Quotation
}

internal extension FutureContractMarginModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginResponse) {
        self.initialMarginOnBuy = grpcModel.initialMarginOnBuy.toModel()
        self.initialMarginOnSell = grpcModel.initialMarginOnSell.toModel()
        self.minPriceIncrement = grpcModel.minPriceIncrement.toModel()
        self.minPriceIncrementAmount = grpcModel.minPriceIncrementAmount.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginResponse {
    func toModel() -> FutureContractMarginModel {
        FutureContractMarginModel(grpcModel: self)
    }
}
