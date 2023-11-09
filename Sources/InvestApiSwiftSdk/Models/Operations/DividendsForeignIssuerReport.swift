import Foundation

/// Отчёт "Справка о доходах за пределами РФ".
public protocol DividendsForeignIssuerReport {
    /// Элементы отчёта.
    var items: [DividendsForeignIssuerReportItem] { get }
    
    /// Количество записей в отчете.
    var itemsCount: Int32 { get }
    
    /// Текущая страница (начинается с 0).
    var page: Int32 { get }
    
    /// Количество страниц с данными отчета (начинается с 0).
    var pagesCount: Int32 { get }
}

internal struct DividendsForeignIssuerReportModel: DividendsForeignIssuerReport {
    let items: [DividendsForeignIssuerReportItem]
    
    let itemsCount: Int32
    
    let page: Int32
    
    let pagesCount: Int32
}

internal extension DividendsForeignIssuerReportModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerReportResponse) {
        self.items = grpcModel.dividendsForeignIssuerReport.map { $0.toModel() }
        self.itemsCount = grpcModel.itemsCount
        self.page = grpcModel.page
        self.pagesCount = grpcModel.pagesCount
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerReportResponse {
    func toModel() -> DividendsForeignIssuerReportModel {
        DividendsForeignIssuerReportModel(grpcModel: self)
    }
}
