import Foundation

/// Портфель по счёту.
public struct Portfolio: Codable {
    /// Идентификатор счёта пользователя.
    public let accountId: String
    
    /// Общая стоимость акций в портфеле в рублях.
    public let totalAmountShares: MoneyValue
    
    /// Общая стоимость облигаций в портфеле в рублях.
    public let totalAmountBonds: MoneyValue
    
    /// Общая стоимость фондов в портфеле в рублях.
    public let totalAmountEtf: MoneyValue
    
    /// Общая стоимость валют в портфеле в рублях.
    public let totalAmountCurrencies: MoneyValue
    
    /// Общая стоимость фьючерсов в портфеле в рублях.
    public let totalAmountFutures: MoneyValue
    
    /// Общая стоимость опционов в портфеле в рублях.
    public let totalAmountOptions: MoneyValue
    
    /// Общая стоимость структурных нот в портфеле в рублях.
    public let totalAmountStructuralNotes: MoneyValue
    
    /// Общая стоимость портфеля в рублях.
    public let totalAmountPortfolio: MoneyValue
    
    /// Текущая относительная доходность портфеля в процентах.
    public let expectedYield: Quotation
    
    /// Список позиций портфеля.
    public let positions: [PortfolioPosition]
    
    /// Список виртуальных позиций портфеля.
    public let virtualPositions: [PortfolioVirtualPosition]
}

internal extension Portfolio {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse) {
        self.accountId = grpcModel.accountID
        self.totalAmountShares = grpcModel.totalAmountShares.toModel()
        self.totalAmountBonds = grpcModel.totalAmountBonds.toModel()
        self.totalAmountEtf = grpcModel.totalAmountEtf.toModel()
        self.totalAmountCurrencies = grpcModel.totalAmountCurrencies.toModel()
        self.totalAmountFutures = grpcModel.totalAmountFutures.toModel()
        self.totalAmountOptions = grpcModel.totalAmountOptions.toModel()
        self.totalAmountStructuralNotes = grpcModel.totalAmountSp.toModel()
        self.totalAmountPortfolio = grpcModel.totalAmountPortfolio.toModel()
        self.expectedYield = grpcModel.expectedYield.toModel()
        self.positions = grpcModel.positions.map { $0.toModel() }
        self.virtualPositions = grpcModel.virtualPositions.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse {
    func toModel() -> Portfolio {
        Portfolio(grpcModel: self)
    }
}
