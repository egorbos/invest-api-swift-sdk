import Foundation

/// Информация о выплате дивиденда.
public protocol Dividend {
    /// Величина дивиденда на 1 ценную бумагу (включая валюту).
    var dividendNet: MoneyValue { get }
    
    /// Дата фактических выплат в часовом поясе UTC.
    var paymentDate: Date { get }
    
    /// Дата объявления дивидендов в часовом поясе UTC.
    var declaredDate: Date { get }
    
    /// Последний день (включительно) покупки для получения выплаты в часовом поясе UTC.
    var lastBuyDate: Date { get }
    
    /// Тип выплаты. Возможные значения: Regular Cash – регулярные выплаты, Cancelled – выплата отменена,
    /// Daily Accrual – ежедневное начисление, Return of Capital – возврат капитала, прочие типы выплат.
    var dividendType: String { get }
    
    /// Дата фиксации реестра в часовом поясе UTC.
    var recordDate: Date { get }
    
    /// Регулярность выплаты. Возможные значения: Annual – ежегодная, Semi-Anl – каждые полгода, прочие типы выплат.
    var regularity: String { get }
    
    /// Цена закрытия инструмента на момент Ex-Dividend Date.
    var closePrice: MoneyValue { get }
    
    /// Величина доходности.
    var yieldValue: Quotation { get }
    
    /// Дата и время создания записи в часовом поясе UTC.
    var createdAt: Date { get }
}

internal struct DividendModel: Dividend {
    let dividendNet: MoneyValue
    
    let paymentDate: Date
    
    let declaredDate: Date
    
    let lastBuyDate: Date
    
    let dividendType: String
    
    let recordDate: Date
    
    let regularity: String
    
    let closePrice: MoneyValue
    
    let yieldValue: Quotation
    
    let createdAt: Date
}

internal extension DividendModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Dividend) {
        self.dividendNet = grpcModel.dividendNet.toModel()
        self.paymentDate = grpcModel.paymentDate.date
        self.declaredDate = grpcModel.declaredDate.date
        self.lastBuyDate = grpcModel.lastBuyDate.date
        self.dividendType = grpcModel.dividendType
        self.recordDate = grpcModel.recordDate.date
        self.regularity = grpcModel.regularity
        self.closePrice = grpcModel.closePrice.toModel()
        self.yieldValue = grpcModel.yieldValue.toModel()
        self.createdAt = grpcModel.createdAt.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Dividend {
    func toModel() -> DividendModel {
        DividendModel(grpcModel: self)
    }
}
