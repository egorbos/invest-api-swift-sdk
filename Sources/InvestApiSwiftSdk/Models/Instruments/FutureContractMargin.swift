///  Размер гарантийного обеспечения по фьючерсному контракту.
public struct FutureContractMargin: Codable {
    /// Гарантийное обеспечение при покупке.
    let initialMarginOnBuy: MoneyValue
    
    /// Гарантийное обеспечение при продаже.
    let initialMarginOnSell: MoneyValue
    
    /// Шаг цены.
    let minPriceIncrement: Quotation
    
    /// Стоимость шага цены.
    let minPriceIncrementAmount: Quotation
}

internal extension FutureContractMargin {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginResponse) {
        self.initialMarginOnBuy = grpcModel.initialMarginOnBuy.toModel()
        self.initialMarginOnSell = grpcModel.initialMarginOnSell.toModel()
        self.minPriceIncrement = grpcModel.minPriceIncrement.toModel()
        self.minPriceIncrementAmount = grpcModel.minPriceIncrementAmount.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginResponse {
    func toModel() -> FutureContractMargin {
        FutureContractMargin(grpcModel: self)
    }
}