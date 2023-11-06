/// Маржинальные показатели.
public struct MarginAttributes: Codable {
    /// Ликвидная стоимость портфеля.
    public let liquidPortfolio: MoneyValue
    
    /// Начальная маржа — начальное обеспечение для совершения новой сделки.
    public let startingMargin: MoneyValue
    
    /// Минимальная маржа — это минимальное обеспечение для поддержания позиции, которую вы уже открыли.
    public let minimalMargin: MoneyValue
    
    /// Уровень достаточности средств. Соотношение стоимости ликвидного портфеля к начальной марже.
    public let fundsSufficiencyLevel: Quotation
    
    /// Объем недостающих средств. Разница между стартовой маржой и ликвидной стоимости портфеля.
    public let amountOfMissingFunds: MoneyValue
}

internal extension MarginAttributes {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse) {
        self.liquidPortfolio = grpcModel.liquidPortfolio.toModel()
        self.startingMargin = grpcModel.startingMargin.toModel()
        self.minimalMargin = grpcModel.minimalMargin.toModel()
        self.fundsSufficiencyLevel = grpcModel.fundsSufficiencyLevel.toModel()
        self.amountOfMissingFunds = grpcModel.amountOfMissingFunds.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse {
    func toModel() -> MarginAttributes {
        MarginAttributes(grpcModel: self)
    }
}
