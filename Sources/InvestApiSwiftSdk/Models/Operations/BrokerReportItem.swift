import Foundation

/// Элемент брокерского отчёта.
public struct BrokerReportItem: Codable {
    /// Номер сделки.
    public let tradeId: String
    
    /// Номер поручения.
    public let orderId: String
    
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Признак исполнения.
    public let executeSign: String
    
    /// Дата и время заключения в часовом поясе UTC.
    public let date: Date
    
    /// Торговая площадка.
    public let exchange: String
    
    /// Режим торгов.
    public let classCode: String
    
    /// Вид сделки.
    public let direction: String
    
    /// Сокращённое наименование актива.
    public let name: String
    
    /// Код актива.
    public let ticker: String
    
    /// Цена за единицу.
    public let price: MoneyValue
    
    /// Количество.
    public let quantity: Int64
    
    /// Сумма (без накопленного купонного дохода).
    public let orderAmount: MoneyValue
    
    /// Накопленный купонный доход.
    public let accumCouponValue: Quotation
    
    /// Сумма сделки.
    public let totalOrderAmount: MoneyValue
    
    /// Комиссия брокера.
    public let brokerCommission: MoneyValue
    
    /// Комиссия биржи.
    public let exchangeCommission: MoneyValue
    
    /// Комиссия клирингового центра.
    public let exchangeClearingCommission:  MoneyValue
    
    /// Ставка РЕПО (%).
    public let repoRate: Quotation
    
    /// Контрагент / Брокер.
    public let party: String
    
    /// Дата расчётов в часовом поясе UTC.
    public let clearValueDate: Date
    
    /// Дата поставки в часовом поясе UTC.
    public let supplyValueDate: Date
    
    /// Статус брокера.
    public let brokerStatus: String
    
    /// Тип договора.
    public let separateAgreementType: String
    
    /// Номер договора.
    public let separateAgreementNumber: String
    
    /// Дата договора.
    public let separateAgreementDate: String
    
    /// Тип расчёта по сделке.
    public let deliveryType: String
}

internal extension BrokerReportItem {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_BrokerReport) {
        self.tradeId = grpcModel.tradeID
        self.orderId = grpcModel.orderID
        self.figi = grpcModel.figi
        self.executeSign = grpcModel.executeSign
        self.date = grpcModel.tradeDatetime.date
        self.exchange = grpcModel.exchange
        self.classCode = grpcModel.classCode
        self.direction = grpcModel.direction
        self.name = grpcModel.name
        self.ticker = grpcModel.ticker
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
        self.orderAmount = grpcModel.orderAmount.toModel()
        self.accumCouponValue = grpcModel.aciValue.toModel()
        self.totalOrderAmount = grpcModel.totalOrderAmount.toModel()
        self.brokerCommission = grpcModel.brokerCommission.toModel()
        self.exchangeCommission = grpcModel.exchangeCommission.toModel()
        self.exchangeClearingCommission = grpcModel.exchangeClearingCommission.toModel()
        self.repoRate = grpcModel.repoRate.toModel()
        self.party = grpcModel.party
        self.clearValueDate = grpcModel.clearValueDate_p.date
        self.supplyValueDate = grpcModel.secValueDate.date
        self.brokerStatus = grpcModel.brokerStatus
        self.separateAgreementType = grpcModel.separateAgreementType
        self.separateAgreementNumber = grpcModel.separateAgreementNumber
        self.separateAgreementDate = grpcModel.separateAgreementDate
        self.deliveryType = grpcModel.deliveryType
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_BrokerReport {
    func toModel() -> BrokerReportItem {
        BrokerReportItem(grpcModel: self)
    }
}
