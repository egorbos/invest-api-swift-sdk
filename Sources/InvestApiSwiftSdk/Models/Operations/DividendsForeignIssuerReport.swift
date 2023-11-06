import Foundation

/// Отчёт "Справка о доходах за пределами РФ".
public struct DividendsForeignIssuerReport: Codable {
    /// Элементы отчёта.
    public let items: [DividendsForeignIssuerReportItem]
    
    /// Количество записей в отчете.
    public let itemsCount: Int32
    
    /// Текущая страница (начинается с 0).
    public let page: Int32
    
    /// Количество страниц с данными отчета (начинается с 0).
    public let pagesCount: Int32
}

internal extension DividendsForeignIssuerReport {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerReportResponse) {
        self.items = grpcModel.dividendsForeignIssuerReport.map { $0.toModel() }
        self.itemsCount = grpcModel.itemsCount
        self.page = grpcModel.page
        self.pagesCount = grpcModel.pagesCount
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerReportResponse {
    func toModel() -> DividendsForeignIssuerReport {
        DividendsForeignIssuerReport(grpcModel: self)
    }
}
