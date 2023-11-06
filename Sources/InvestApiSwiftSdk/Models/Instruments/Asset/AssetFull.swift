import Foundation

/// Информация об активе.
public struct AssetFull: Codable {
    /// Уникальный идентификатор актива.
    public let uid: String
    
    /// Тип актива.
    public let type: AssetType
    
    /// Наименование актива.
    public let name: String
    
    /// Краткое наименование актива.
    public let nameBrief: String
    
    /// Описание актива.
    public let description: String
    
    /// Тестирование клиентов.
    public let requiredTests: [String]
    
    /// Валюта (обязательно и заполняется только для type = "ASSET_TYPE_CURRENCY").
    public let currency: AssetCurrency?
    
    /// Ценная бумага (обязательно и заполняется только для type = "ASSET_TYPE_SECURITY").
    public let security: AssetSecurity?
    
    /// Номер государственной регистрации.
    public let regCode: String
    
    /// Код CFI.
    public let cfiCode: String
    
    /// Код НРД инструмента.
    public let nsdCode: String
    
    /// Статус актива.
    public let status: String
    
    /// Бренд.
    public let brand: Brand
    
    /// Код типа ценной бумаги по классификации Банка России.
    public let brCode: String
    
    /// Наименование кода типа ценной бумаги по классификации Банка России.
    public let brCodeName: String
    
    /// Идентификаторы инструментов.
    public let instruments: [AssetInstrument]
    
    /// Дата и время последнего обновления записи.
    public let updatedAt: Date
    
    /// Дата и время удаления актива.
    public let deletedAt: Date
}

internal extension AssetFull {
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
    func toModel() throws -> AssetFull {
        try AssetFull(grpcModel: self)
    }
}
