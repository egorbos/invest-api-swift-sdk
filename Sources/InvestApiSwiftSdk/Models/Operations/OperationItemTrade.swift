import Foundation

/// Сделка по операции.
public protocol OperationItemTrade {
    /// Номер сделки.
    var number: String { get }
    
    /// Дата сделки.
    var date: Date { get }
    
    /// Количество в единицах.
    var quantity: Int64 { get }
    
    /// Цена.
    var price: MoneyValue { get }
    
    /// Доходность.
    var yield: MoneyValue { get }
    
    /// Относительная доходность.
    var yieldRelative: Quotation { get }
}

internal struct OperationItemTradeModel: OperationItemTrade {
    let number: String
    
    let date: Date
    
    let quantity: Int64
    
    let price: MoneyValue
    
    let yield: MoneyValue
    
    let yieldRelative: Quotation
}

internal extension OperationItemTradeModel {
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
    func toModel() -> OperationItemTradeModel {
        OperationItemTradeModel(grpcModel: self)
    }
}
