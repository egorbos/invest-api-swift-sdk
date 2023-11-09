/// Маржинальные показатели.
public protocol MarginAttributes {
    /// Ликвидная стоимость портфеля.
    var liquidPortfolio: MoneyValue { get }
    
    /// Начальная маржа — начальное обеспечение для совершения новой сделки.
    var startingMargin: MoneyValue { get }
    
    /// Минимальная маржа — это минимальное обеспечение для поддержания позиции, которую вы уже открыли.
    var minimalMargin: MoneyValue { get }
    
    /// Уровень достаточности средств. Соотношение стоимости ликвидного портфеля к начальной марже.
    var fundsSufficiencyLevel: Quotation { get }
    
    /// Объем недостающих средств. Разница между стартовой маржой и ликвидной стоимости портфеля.
    var amountOfMissingFunds: MoneyValue { get }
}

internal struct MarginAttributesModel: MarginAttributes {
    let liquidPortfolio: MoneyValue
    
    let startingMargin: MoneyValue
    
    let minimalMargin: MoneyValue
    
    let fundsSufficiencyLevel: Quotation
    
    let amountOfMissingFunds: MoneyValue
}

internal extension MarginAttributesModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse) {
        self.liquidPortfolio = grpcModel.liquidPortfolio.toModel()
        self.startingMargin = grpcModel.startingMargin.toModel()
        self.minimalMargin = grpcModel.minimalMargin.toModel()
        self.fundsSufficiencyLevel = grpcModel.fundsSufficiencyLevel.toModel()
        self.amountOfMissingFunds = grpcModel.amountOfMissingFunds.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse {
    func toModel() -> MarginAttributesModel {
        MarginAttributesModel(grpcModel: self)
    }
}
