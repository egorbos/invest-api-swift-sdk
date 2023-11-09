import Foundation

/// Отчёт "Справка о доходах за пределами РФ".
public protocol DividendsForeignIssuerReportItem {
    /// Дата фиксации реестра.
    var recordDate: Date { get }
    
    /// Дата выплаты.
    var paymentDate: Date { get }
    
    /// Наименование ценной бумаги.
    var securityName: String { get }
    
    /// ISIN-идентификатор ценной бумаги.
    var isin: String { get }
    
    /// Страна эмитента (для депозитарных расписок указывается страна эмитента базового актива).
    var issuerCountry: String { get }
    
    /// Количество ценных бумаг.
    var quantity: Int64 { get }
    
    /// Выплаты на одну бумагу.
    var dividend: Quotation { get }
    
    /// Комиссия внешних платёжных агентов.
    var externalCommission: Quotation { get }
    
    /// Сумма до удержания налога.
    var dividendGross: Quotation { get }
    
    /// Сумма налога, удержанного агентом.
    var tax: Quotation { get }
    
    /// Итоговая сумма выплаты.
    var dividendAmount: Quotation { get }
    
    /// Валюта.
    var currency: CurrencyType { get }
}

internal struct DividendsForeignIssuerReportItemModel: DividendsForeignIssuerReportItem {
    let recordDate: Date
    
    let paymentDate: Date
    
    let securityName: String
    
    let isin: String
    
    let issuerCountry: String
    
    let quantity: Int64
    
    let dividend: Quotation
    
    let externalCommission: Quotation
    
    let dividendGross: Quotation
    
    let tax: Quotation
    
    let dividendAmount: Quotation
    
    let currency: CurrencyType
}

internal extension DividendsForeignIssuerReportItemModel {
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
    func toModel() -> DividendsForeignIssuerReportItemModel {
        DividendsForeignIssuerReportItemModel(grpcModel: self)
    }
}
