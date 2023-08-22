import Foundation

/// Элемент брокерского отчёта.
public struct BrokerReportItem: Codable {
    /// Номер сделки.
    let tradeId: String
    
    /// Номер поручения.
    let orderId: String
    
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Признак исполнения.
    let executeSign: String
    
    /// Дата и время заключения в часовом поясе UTC.
    let date: Date
    
    /// Торговая площадка.
    let exchange: String
    
    /// Режим торгов.
    let classCode: String
    
    /// Вид сделки.
    let direction: String
    
    /// Сокращённое наименование актива.
    let name: String
    
    /// Код актива.
    let ticker: String
    
    /// Цена за единицу.
    let price: MoneyValue
    
    /// Количество.
    let quantity: Int64
    
    /// Сумма (без накопленного купонного дохода).
    let orderAmount: MoneyValue
    
    /// Накопленный купонный доход.
    let accumCouponValue: Quotation
    
    /// Сумма сделки.
    let totalOrderAmount: MoneyValue
    
    /// Комиссия брокера.
    let brokerCommission: MoneyValue
    
    /// Комиссия биржи.
    let exchangeCommission: MoneyValue
    
    /// Комиссия клирингового центра.
    let exchangeClearingCommission:  MoneyValue
    
    /// Ставка РЕПО (%).
    let repoRate: Quotation
    
    /// Контрагент / Брокер.
    let party: String
    
    /// Дата расчётов в часовом поясе UTC.
    let clearValueDate: Date
    
    /// Дата поставки в часовом поясе UTC.
    let supplyValueDate: Date
    
    /// Статус брокера.
    let brokerStatus: String
    
    /// Тип договора.
    let separateAgreementType: String
    
    /// Номер договора.
    let separateAgreementNumber: String
    
    /// Дата договора.
    let separateAgreementDate: String
    
    /// Тип расчёта по сделке.
    let deliveryType: String
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
