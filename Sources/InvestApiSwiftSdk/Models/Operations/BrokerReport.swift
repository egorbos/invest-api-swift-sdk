import Foundation

/// Брокерский отчёт.
public struct BrokerReport: Codable {
    /// Элементы отчёта.
    public let items: [BrokerReportItem]
    
    /// Количество записей в отчете.
    public let itemsCount: Int32
    
    /// Текущая страница (начинается с 0).
    public let page: Int32
    
    /// Количество страниц с данными отчета (начинается с 0).
    public let pagesCount: Int32
}

internal extension BrokerReport {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetBrokerReportResponse) {
        self.items = grpcModel.brokerReport.map { $0.toModel() }
        self.itemsCount = grpcModel.itemsCount
        self.page = grpcModel.page
        self.pagesCount = grpcModel.pagesCount
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetBrokerReportResponse {
    func toModel() -> BrokerReport {
        BrokerReport(grpcModel: self)
    }
}
