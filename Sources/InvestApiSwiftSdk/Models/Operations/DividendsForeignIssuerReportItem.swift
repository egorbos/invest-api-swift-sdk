import Foundation

/// Отчёт "Справка о доходах за пределами РФ".
public struct DividendsForeignIssuerReportItem: Codable {
    /// Дата фиксации реестра.
    public let recordDate: Date
    
    /// Дата выплаты.
    public let paymentDate: Date
    
    /// Наименование ценной бумаги.
    public let securityName: String
    
    /// ISIN-идентификатор ценной бумаги.
    public let isin: String
    
    /// Страна эмитента (для депозитарных расписок указывается страна эмитента базового актива).
    public let issuerCountry: String
    
    /// Количество ценных бумаг.
    public let quantity: Int64
    
    /// Выплаты на одну бумагу.
    public let dividend: Quotation
    
    /// Комиссия внешних платёжных агентов.
    public let externalCommission: Quotation
    
    /// Сумма до удержания налога.
    public let dividendGross: Quotation
    
    /// Сумма налога, удержанного агентом.
    public let tax: Quotation
    
    /// Итоговая сумма выплаты.
    public let dividendAmount: Quotation
    
    /// Валюта.
    public let currency: CurrencyType
}

internal extension DividendsForeignIssuerReportItem {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_DividendsForeignIssuerReport) {
        self.recordDate = grpcModel.recordDate.date
        self.paymentDate = grpcModel.paymentDate.date
        self.securityName = grpcModel.securityName
        self.isin = grpcModel.isin
        self.issuerCountry = grpcModel.issuerCountry
        self.quantity = grpcModel.quantity
        self.dividend = grpcModel.dividend.toModel()
        self.externalCommission = grpcModel.externalCommission.toModel()
        self.dividendGross = grpcModel.dividendGross.toModel()
        self.tax = grpcModel.tax.toModel()
        self.dividendAmount = grpcModel.dividendAmount.toModel()
        self.currency = CurrencyType(rawValue: grpcModel.currency) ?? .unspecified
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_DividendsForeignIssuerReport {
    func toModel() -> DividendsForeignIssuerReportItem {
        DividendsForeignIssuerReportItem(grpcModel: self)
    }
}
