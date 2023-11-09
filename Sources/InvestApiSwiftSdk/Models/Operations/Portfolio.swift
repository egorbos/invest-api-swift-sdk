import Foundation

/// Портфель по счёту.
public protocol Portfolio {
    /// Идентификатор счёта пользователя.
    var accountId: String { get }
    
    /// Общая стоимость акций в портфеле в рублях.
    var totalAmountShares: MoneyValue { get }
    
    /// Общая стоимость облигаций в портфеле в рублях.
    var totalAmountBonds: MoneyValue { get }
    
    /// Общая стоимость фондов в портфеле в рублях.
    var totalAmountEtf: MoneyValue { get }
    
    /// Общая стоимость валют в портфеле в рублях.
    var totalAmountCurrencies: MoneyValue { get }
    
    /// Общая стоимость фьючерсов в портфеле в рублях.
    var totalAmountFutures: MoneyValue { get }
    
    /// Общая стоимость опционов в портфеле в рублях.
    var totalAmountOptions: MoneyValue { get }
    
    /// Общая стоимость структурных нот в портфеле в рублях.
    var totalAmountStructuralNotes: MoneyValue { get }
    
    /// Общая стоимость портфеля в рублях.
    var totalAmountPortfolio: MoneyValue { get }
    
    /// Текущая относительная доходность портфеля в процентах.
    var expectedYield: Quotation { get }
    
    /// Список позиций портфеля.
    var positions: [PortfolioPosition] { get }
    
    /// Список виртуальных позиций портфеля.
    var virtualPositions: [PortfolioVirtualPosition] { get }
}

internal struct PortfolioModel: Portfolio {
    let accountId: String
    
    let totalAmountShares: MoneyValue
    
    let totalAmountBonds: MoneyValue
    
    let totalAmountEtf: MoneyValue
    
    let totalAmountCurrencies: MoneyValue
    
    let totalAmountFutures: MoneyValue
    
    let totalAmountOptions: MoneyValue
    
    let totalAmountStructuralNotes: MoneyValue
    
    let totalAmountPortfolio: MoneyValue
    
    let expectedYield: Quotation
    
    let positions: [PortfolioPosition]
    
    let virtualPositions: [PortfolioVirtualPosition]
}

internal extension PortfolioModel {
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
    func toModel() -> PortfolioModel {
        PortfolioModel(grpcModel: self)
    }
}
