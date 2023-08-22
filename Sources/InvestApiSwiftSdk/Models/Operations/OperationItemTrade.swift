import Foundation

/// Сделка по операции.
public struct OperationItemTrade: Codable {
    /// Номер сделки.
    let number: String
    
    /// Дата сделки.
    let date: Date
    
    /// Количество в единицах.
    let quantity: Int64
    
    /// Цена.
    let price: MoneyValue
    
    /// Доходность.
    let yield: MoneyValue
    
    /// Относительная доходность.
    let yieldRelative: Quotation
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
