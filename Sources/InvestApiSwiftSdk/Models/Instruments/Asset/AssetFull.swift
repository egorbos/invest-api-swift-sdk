import Foundation

/// Информация об активе.
public protocol AssetFull {
    /// Уникальный идентификатор актива.
    var uid: String { get }
    
    /// Тип актива.
    var type: AssetType { get }
    
    /// Наименование актива.
    var name: String { get }
    
    /// Краткое наименование актива.
    var nameBrief: String { get }
    
    /// Описание актива.
    var description: String { get }
    
    /// Тестирование клиентов.
    var requiredTests: [String] { get }
    
    /// Валюта (обязательно и заполняется только для type = "ASSET_TYPE_CURRENCY").
    var currency: AssetCurrency? { get }
    
    /// Ценная бумага (обязательно и заполняется только для type = "ASSET_TYPE_SECURITY").
    var security: AssetSecurity? { get }
    
    /// Номер государственной регистрации.
    var regCode: String { get }
    
    /// Код CFI.
    var cfiCode: String { get }
    
    /// Код НРД инструмента.
    var nsdCode: String { get }
    
    /// Статус актива.
    var status: String { get }
    
    /// Бренд.
    var brand: Brand { get }
    
    /// Код типа ценной бумаги по классификации Банка России.
    var brCode: String { get }
    
    /// Наименование кода типа ценной бумаги по классификации Банка России.
    var brCodeName: String { get }
    
    /// Идентификаторы инструментов.
    var instruments: [AssetInstrument] { get }
    
    /// Дата и время последнего обновления записи.
    var updatedAt: Date { get }
    
    /// Дата и время удаления актива.
    var deletedAt: Date { get }
}

internal struct AssetFullModel: AssetFull {
    let uid: String
    
    let type: AssetType
    
    let name: String
    
    let nameBrief: String
    
    let description: String
    
    let requiredTests: [String]
    
    let currency: AssetCurrency?
    
    let security: AssetSecurity?
    
    let regCode: String
    
    let cfiCode: String
    
    let nsdCode: String
    
    let status: String
   
    let brand: Brand
    
    let brCode: String
    
    let brCodeName: String
    
    let instruments: [AssetInstrument]
    
    let updatedAt: Date
    
    let deletedAt: Date
}

internal extension AssetFullModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetFull) throws {
        self.uid = grpcModel.uid
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.name = grpcModel.name
        self.nameBrief = grpcModel.nameBrief
        self.description = grpcModel.description_p
        self.requiredTests = grpcModel.requiredTests
        self.currency = grpcModel.currency.toModel()
        self.security = try grpcModel.security.toModel()
        self.regCode = grpcModel.gosRegCode
        self.cfiCode = grpcModel.cfi
        self.nsdCode = grpcModel.codeNsd
        self.status = grpcModel.status
        self.brand = grpcModel.brand.toModel()
        self.brCode = grpcModel.brCode
        self.brCodeName = grpcModel.brCodeName
        self.instruments = try grpcModel.instruments.map { try $0.toModel() }
        self.updatedAt = grpcModel.updatedAt.date
        self.deletedAt = grpcModel.deletedAt.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetFull {
    func toModel() throws -> AssetFullModel {
        try AssetFullModel(grpcModel: self)
    }
}
