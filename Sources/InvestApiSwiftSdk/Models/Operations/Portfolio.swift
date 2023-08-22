import Foundation

/// Портфель по счёту.
public struct Portfolio: Codable {
    /// Идентификатор счёта пользователя.
    let accountId: String
    
    /// Общая стоимость акций в портфеле в рублях.
    let totalAmountShares: MoneyValue
    
    /// Общая стоимость облигаций в портфеле в рублях.
    let totalAmountBonds: MoneyValue
    
    /// Общая стоимость фондов в портфеле в рублях.
    let totalAmountEtf: MoneyValue
    
    /// Общая стоимость валют в портфеле в рублях.
    let totalAmountCurrencies: MoneyValue
    
    /// Общая стоимость фьючерсов в портфеле в рублях.
    let totalAmountFutures: MoneyValue
    
    /// Общая стоимость опционов в портфеле в рублях.
    let totalAmountOptions: MoneyValue
    
    /// Общая стоимость структурных нот в портфеле в рублях.
    let totalAmountStructuralNotes: MoneyValue
    
    /// Общая стоимость портфеля в рублях.
    let totalAmountPortfolio: MoneyValue
    
    /// Текущая относительная доходность портфеля в процентах.
    let expectedYield: Quotation
    
    /// Список позиций портфеля.
    let positions: [PortfolioPosition]
    
    /// Список виртуальных позиций портфеля.
    let virtualPositions: [PortfolioVirtualPosition]
}

internal extension Portfolio {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse) throws {
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
        self.positions = try grpcModel.positions.map { try $0.toModel() }
        self.virtualPositions = try grpcModel.virtualPositions.map { try $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse {
    func toModel() throws -> Portfolio {
        try Portfolio(grpcModel: self)
    }
}
