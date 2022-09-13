import Foundation

public struct MarginAttributes: Codable {
    /// Ликвидная стоимость портфеля.
    let liquidPortfolio: MoneyValue
    
    /// Начальная маржа — начальное обеспечение для совершения новой сделки.
    let startingMargin: MoneyValue
    
    /// Минимальная маржа — это минимальное обеспечение для поддержания позиции, которую вы уже открыли.
    let minimalMargin: MoneyValue
    
    /// Уровень достаточности средств. Соотношение стоимости ликвидного портфеля к начальной марже.
    let fundsSufficiencyLevel: Quotation
    
    /// Объем недостающих средств. Разница между стартовой маржой и ликвидной стоимости портфеля.
    let amountOfMissingFunds: MoneyValue
}

internal extension MarginAttributes {
    init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse) {
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
