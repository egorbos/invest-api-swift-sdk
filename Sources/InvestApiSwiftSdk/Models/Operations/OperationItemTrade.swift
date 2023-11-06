import Foundation

/// Сделка по операции.
public struct OperationItemTrade: Codable {
    /// Номер сделки.
    public let number: String
    
    /// Дата сделки.
    public let date: Date
    
    /// Количество в единицах.
    public let quantity: Int64
    
    /// Цена.
    public let price: MoneyValue
    
    /// Доходность.
    public let yield: MoneyValue
    
    /// Относительная доходность.
    public let yieldRelative: Quotation
}

internal extension OperationItemTrade {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OperationItemTrade) {
        self.number = grpcModel.num
        self.date = grpcModel.date.date
        self.quantity = grpcModel.quantity
        self.price = grpcModel.price.toModel()
        self.yield = grpcModel.yield.toModel()
        self.yieldRelative = grpcModel.yieldRelative.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OperationItemTrade {
    func toModel() -> OperationItemTrade {
        OperationItemTrade(grpcModel: self)
    }
}
