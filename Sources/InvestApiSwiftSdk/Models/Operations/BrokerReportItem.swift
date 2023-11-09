import Foundation

/// Элемент брокерского отчёта.
public protocol BrokerReportItem {
    /// Номер сделки.
    var tradeId: String { get }
    
    /// Номер поручения.
    var orderId: String { get }
    
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Признак исполнения.
    var executeSign: String { get }
    
    /// Дата и время заключения в часовом поясе UTC.
    var date: Date { get }
    
    /// Торговая площадка.
    var exchange: String { get }
    
    /// Режим торгов.
    var classCode: String { get }
    
    /// Вид сделки.
    var direction: String { get }
    
    /// Сокращённое наименование актива.
    var name: String { get }
    
    /// Код актива.
    var ticker: String { get }
    
    /// Цена за единицу.
    var price: MoneyValue { get }
    
    /// Количество.
    var quantity: Int64 { get }
    
    /// Сумма (без накопленного купонного дохода).
    var orderAmount: MoneyValue { get }
    
    /// Накопленный купонный доход.
    var accumCouponValue: Quotation { get }
    
    /// Сумма сделки.
    var totalOrderAmount: MoneyValue { get }
    
    /// Комиссия брокера.
    var brokerCommission: MoneyValue { get }
    
    /// Комиссия биржи.
    var exchangeCommission: MoneyValue { get }
    
    /// Комиссия клирингового центра.
    var exchangeClearingCommission:  MoneyValue { get }
    
    /// Ставка РЕПО (%).
    var repoRate: Quotation { get }
    
    /// Контрагент / Брокер.
    var party: String { get }
    
    /// Дата расчётов в часовом поясе UTC.
    var clearValueDate: Date { get }
    
    /// Дата поставки в часовом поясе UTC.
    var supplyValueDate: Date { get }
    
    /// Статус брокера.
    var brokerStatus: String { get }
    
    /// Тип договора.
    var separateAgreementType: String { get }
    
    /// Номер договора.
    var separateAgreementNumber: String { get }
    
    /// Дата договора.
    var separateAgreementDate: String { get }
    
    /// Тип расчёта по сделке.
    var deliveryType: String { get }
}

internal struct BrokerReportItemModel: BrokerReportItem {
    let tradeId: String
    
    let orderId: String
    
    let figi: String
    
    let executeSign: String
    
    let date: Date
    
    let exchange: String
    
    let classCode: String
    
    let direction: String
    
    let name: String
    
    let ticker: String
    
    let price: MoneyValue
    
    let quantity: Int64
    
    let orderAmount: MoneyValue
    
    let accumCouponValue: Quotation
    
    let totalOrderAmount: MoneyValue
    
    let brokerCommission: MoneyValue
    
    let exchangeCommission: MoneyValue
    
    let exchangeClearingCommission: MoneyValue
    
    let repoRate: Quotation
    
    let party: String
    
    let clearValueDate: Date
    
    let supplyValueDate: Date
    
    let brokerStatus: String
    
    let separateAgreementType: String
    
    let separateAgreementNumber: String
    
    let separateAgreementDate: String
    
    let deliveryType: String
}

internal extension BrokerReportItemModel {
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
    func toModel() -> BrokerReportItemModel {
        BrokerReportItemModel(grpcModel: self)
    }
}
