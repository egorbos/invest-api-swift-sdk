import Foundation

/// Брокерский отчёт.
public protocol BrokerReport {
    /// Элементы отчёта.
    var items: [BrokerReportItem] { get }
    
    /// Количество записей в отчете.
    var itemsCount: Int32 { get }
    
    /// Текущая страница (начинается с 0).
    var page: Int32 { get }
    
    /// Количество страниц с данными отчета (начинается с 0).
    var pagesCount: Int32 { get }
}

internal struct BrokerReportModel: BrokerReport {
    let items: [BrokerReportItem]
    
    let itemsCount: Int32
    
    let page: Int32
    
    let pagesCount: Int32
}

internal extension BrokerReportModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetBrokerReportResponse) {
        self.items = grpcModel.brokerReport.map { $0.toModel() }
        self.itemsCount = grpcModel.itemsCount
        self.page = grpcModel.page
        self.pagesCount = grpcModel.pagesCount
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetBrokerReportResponse {
    func toModel() -> BrokerReportModel {
        BrokerReportModel(grpcModel: self)
    }
}
