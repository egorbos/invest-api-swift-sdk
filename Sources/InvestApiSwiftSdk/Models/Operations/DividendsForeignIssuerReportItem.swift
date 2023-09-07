import Foundation

/// Отчёт "Справка о доходах за пределами РФ".
public struct DividendsForeignIssuerReportItem: Codable {
    /// Дата фиксации реестра.
    let recordDate: Date
    
    /// Дата выплаты.
    let paymentDate: Date
    
    /// Наименование ценной бумаги.
    let securityName: String
    
    /// ISIN-идентификатор ценной бумаги.
    let isin: String
    
    /// Страна эмитента (для депозитарных расписок указывается страна эмитента базового актива).
    let issuerCountry: String
    
    /// Количество ценных бумаг.
    let quantity: Int64
    
    /// Выплаты на одну бумагу.
    let dividend: Quotation
    
    /// Комиссия внешних платёжных агентов.
    let externalCommission: Quotation
    
    /// Сумма до удержания налога.
    let dividendGross: Quotation
    
    /// Сумма налога, удержанного агентом.
    let tax: Quotation
    
    /// Итоговая сумма выплаты.
    let dividendAmount: Quotation
    
    /// Валюта.
    let currency: String // MARK: Возможно изменить на CurrencyType?
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
        self.currency = grpcModel.currency
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_DividendsForeignIssuerReport {
    func toModel() -> DividendsForeignIssuerReportItem {
        DividendsForeignIssuerReportItem(grpcModel: self)
    }
}
