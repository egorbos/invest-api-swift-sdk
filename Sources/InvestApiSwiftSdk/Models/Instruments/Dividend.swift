import Foundation

/// Информация о выплате дивиденда.
public struct Dividend: Codable {
    /// Величина дивиденда на 1 ценную бумагу (включая валюту).
    public let dividendNet: MoneyValue
    
    /// Дата фактических выплат в часовом поясе UTC.
    public let paymentDate: Date
    
    /// Дата объявления дивидендов в часовом поясе UTC.
    public let declaredDate: Date
    
    /// Последний день (включительно) покупки для получения выплаты в часовом поясе UTC.
    public let lastBuyDate: Date
    
    /// Тип выплаты. Возможные значения: Regular Cash – регулярные выплаты, Cancelled – выплата отменена, Daily Accrual – ежедневное начисление, Return of Capital – возврат капитала, прочие типы выплат.
    public let dividendType: String
    
    /// Дата фиксации реестра в часовом поясе UTC.
    public let recordDate: Date
    
    /// Регулярность выплаты. Возможные значения: Annual – ежегодная, Semi-Anl – каждые полгода, прочие типы выплат.
    public let regularity: String
    
    /// Цена закрытия инструмента на момент Ex-Dividend Date.
    public let closePrice: MoneyValue
    
    /// Величина доходности.
    public let yieldValue: Quotation
    
    /// Дата и время создания записи в часовом поясе UTC.
    public let createdAt: Date
}

internal extension Dividend {
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
    func toModel() -> Dividend {
        Dividend(grpcModel: self)
    }
}
