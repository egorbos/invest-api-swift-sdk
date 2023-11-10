import Foundation

public final class CommonApiRequest<Result>: ApiRequest<CommonApiClient, Result> {
    // MARK: Сервис предоставления справочной информации о пользователе.
    
    /// Экземпляр `CommonApiRequest` для получения счетов пользователя.
    public static var getAccounts: CommonApiRequest<[Account]> {
        .init {
            try $0.user.getAccounts()
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - Parameter accountId: Идентификатор счёта пользователя.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func getMarginAttributes(accountId id: String) -> CommonApiRequest<MarginAttributes> {
        .init {
            try $0.user.getMarginAttributes(accountId: id)
        }
    }
    
    /// Экземпляр `CommonApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: CommonApiRequest<UserTariff> {
        .init {
            try $0.user.getUserTariff()
        }
    }
    
    /// Экземпляр `CommonApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: CommonApiRequest<UserInfo> {
        .init {
            try $0.user.getInfo()
        }
    }
    
    // MARK: Сервис получения биржевой информации.
    
    /// Возвращает экземпляр `CommonApiRequest` для получения исторических свечей по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func getCandles(figi: String, from: Date, to: Date, interval: CandleInterval) -> CommonApiRequest<[HistoricalCandle]> {
        .init {
            try $0.marketData.getCandles(figi: figi, from: from, to: to, interval: interval)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения последних цен по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func getLastPrices(figis: [String]) -> CommonApiRequest<[LastPrice]> {
        .init {
            try $0.marketData.getLastPrices(figis: figis)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения стакана по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func getOrderBook(figi: String, depth: Int32) -> CommonApiRequest<OrderBookInfo> {
        .init {
            try $0.marketData.getOrderBook(figi: figi, depth: depth)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения статуса торгов по инструментам.
    ///
    ///  - Parameter figi: Figi идентификатор инструмента.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func getTradingStatus(figi: String) -> CommonApiRequest<TradingStatusInfo> {
        .init {
            try $0.marketData.getTradingStatus(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения обезличенных сделок за последний час.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func getLastTrades(figi: String, from: Date, to: Date) -> CommonApiRequest<[Trade]> {
        .init {
            $0.marketData.getLastTrades(figi: figi, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения цен закрытия торговой сессии по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func getClosePrices(figis: [String]) -> CommonApiRequest<[InstrumentClosePrice]> {
        .init {
            try $0.marketData.getClosePrices(figis: figis)
        }
    }
    
    // MARK: Сервис получения справочной информации о ценных бумагах.
    
    /// Возвращает экземпляр `CommonApiRequest` для получения расписания работы торговых площадок.
    ///
    /// - Parameters:
    ///     - exchange: Наименование биржи или расчетного календаря.
    ///     - from: Начало периода по часовому поясу UTC.
    ///     - to: Окончание периода по часовому поясу UTC.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func tradingSchedules(exchange: String, from: Date, to: Date) -> CommonApiRequest<[TradingSchedule]> {
        .init {
            $0.instruments.tradingSchedules(exchange: exchange, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения облигации по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    ///  - Returns: Экземпляр `CommonApiRequest`.
    public static func bondBy(idType: InstrumentIdType, classCode: String, id: String) -> CommonApiRequest<Bond> {
        .init {
            try $0.instruments.bondBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения списка облигаций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func bonds(instrumentStatus: InstrumentStatus) -> CommonApiRequest<[Bond]> {
        .init {
            try $0.instruments.bonds(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения графика выплат купонов по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getBondCoupons(figi: String, from: Date, to: Date) -> CommonApiRequest<[Coupon]> {
        .init {
            try $0.instruments.getBondCoupons(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения валюты по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func currencyBy(idType: InstrumentIdType, classCode: String, id: String) -> CommonApiRequest<Currency> {
        .init {
            try $0.instruments.currencyBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения списка валют.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func currencies(instrumentStatus: InstrumentStatus) -> CommonApiRequest<[Currency]> {
        .init {
            try $0.instruments.currencies(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения инвестиционного фонда по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func etfBy(idType: InstrumentIdType, classCode: String, id: String) -> CommonApiRequest<Etf> {
        .init {
            try $0.instruments.etfBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения списка инвестиционных фондов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func etfs(instrumentStatus: InstrumentStatus) -> CommonApiRequest<[Etf]> {
        .init {
            try $0.instruments.etfs(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения фьючерсного контракта по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func futureBy(idType: InstrumentIdType, classCode: String, id: String) -> CommonApiRequest<Future> {
        .init {
            try $0.instruments.futureBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения списка фьючерсных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func futures(instrumentStatus: InstrumentStatus) -> CommonApiRequest<[Future]> {
        .init {
            try $0.instruments.futures(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения опционного контракта по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func optionBy(idType: InstrumentIdType, classCode: String, id: String) -> CommonApiRequest<Option> {
        .init {
            try $0.instruments.optionBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения списка опционных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func options(instrumentStatus: InstrumentStatus) -> CommonApiRequest<[Option]> {
        .init {
            try $0.instruments.options(instrumentStatus: instrumentStatus)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения списка опционных контрактов.
    ///
    /// - Parameters:
    ///     - basicAssetUid: Идентификатор базового актива опциона (обязательный параметр).
    ///     - basicAssetPositionUid: Идентификатор позиции базового актива опционного контракта.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func optionsBy(basicAssetUid: String, basicAssetPositionUid: String) -> CommonApiRequest<[Option]> {
        .init {
            try $0.instruments.optionsBy(basicAssetUid: basicAssetUid, basicAssetPositionUid: basicAssetPositionUid)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения акции по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func shareBy(idType: InstrumentIdType, classCode: String, id: String) -> CommonApiRequest<Share> {
        .init {
            try $0.instruments.shareBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения списка акций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func shares(instrumentStatus: InstrumentStatus) -> CommonApiRequest<[Share]> {
        .init {
            try $0.instruments.shares(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения накопленного купонного дохода по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getAccruedInterests(figi: String, from: Date, to: Date) -> CommonApiRequest<[AccruedInterest]> {
        .init {
            $0.instruments.getAccruedInterests(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения размера гарантийного обеспечения по фьючерсному контракту.
    ///
    /// - Parameter figi: Figi-идентификатор инструмента.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getFutureContractMargin(figi: String) -> CommonApiRequest<FutureContractMargin> {
        .init {
            $0.instruments.getFutureContractMargin(figi: figi)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения основной информации об инструменте.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getInstrumentBy(idType: InstrumentIdType, classCode: String, id: String) -> CommonApiRequest<Instrument> {
        .init {
            try $0.instruments.getInstrumentBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения событий выплаты дивидендов по инструменту.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getDividends(figi: String, from: Date, to: Date) -> CommonApiRequest<[Dividend]> {
        .init {
            $0.instruments.getDividends(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения актива по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор актива.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getAssetBy(uid: String) -> CommonApiRequest<AssetFull> {
        .init {
            try $0.instruments.getAssetBy(uid: uid)
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения списка активов (работает для всех инструментов, за исключением срочных - опционов и фьючерсов).
    ///
    /// - Parameter kind: Вид запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getAssets(kind: InstrumentKind) -> CommonApiRequest<[Asset]> {
        .init {
            try $0.instruments.getAssets(kind: kind)
        }
    }

    /// Экземпляр `CommonApiRequest` для получения списка избранных инструментов.
    public static var getFavorites: CommonApiRequest<[FavoriteInstrument]> {
        .init {
            try $0.instruments.getFavorites()
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для редактирования списка избранных инструментов.
    ///
    /// - Parameters:
    ///     - figis: Список figi идентификаторов инструментов.
    ///     - action: Тип действия со списком.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func editFavorites(figis: [String], action: FavoriteActionType) -> CommonApiRequest<[FavoriteInstrument]> {
        .init {
            try $0.instruments.editFavorites(figis: figis, action: action)
        }
    }

    /// Экземпляр `CommonApiRequest` для получения списка стран.
    public static var getCountries: CommonApiRequest<[Country]> {
        .init {
            try $0.instruments.getCountries()
        }
    }

    /// Возвращает экземпляр `CommonApiRequest` для получения инструмента.
    ///
    /// - Parameters:
    ///     - query: Строка поиска.
    ///     - kind: Фильтр по виду инструмента.
    ///     - apiTradeAvailableFlag: Фильтр для отображения только торговых инструментов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func findInstrument(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) -> CommonApiRequest<[InstrumentShort]> {
        .init {
            try $0.instruments.findInstrument(query: query, kind: kind, apiTradeAvailableFlag: apiTradeAvailableFlag)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения бренда по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор бренда.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getBrandBy(uid: String) -> CommonApiRequest<Brand> {
        .init {
            try $0.instruments.getBrandBy(uid: uid)
        }
    }

    /// Экземпляр `CommonApiRequest` для получения списка брендов.
    public static var getBrands: CommonApiRequest<[Brand]> {
        .init {
            try $0.instruments.getBrands()
        }
    }
    
    // MARK: Сервис получения списка операций, портфеля, позиций ценных бумаг и т.д.
    
    /// Возвращает экземпляр `CommonApiRequest` для получения списка операций по счёту.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) -> CommonApiRequest<[Operation]> {
        .init {
            try $0.operations.getOperations(accountId: accountId, from: from, to: to, state: state, figi: figi)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения портфеля по счёту.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта.
    ///     - currency: Валюта представления портфеля.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getPortfolio(accountId: String, currency: CurrencyType) -> CommonApiRequest<Portfolio> {
        .init {
            try $0.operations.getPortfolio(accountId: accountId, currency: currency)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения списка позиций по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getPositions(accountId: String) -> CommonApiRequest<PositionsCollection> {
        .init {
            try $0.operations.getPositions(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения доступного остатка для вывода средств.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getWithdrawLimits(accountId: String) -> CommonApiRequest<WithdrawLimits> {
        .init {
            try $0.operations.getWithdrawLimits(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для формирования брокерского отчёта.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func generateBrokerReport(accountId: String, from: Date, to: Date) ->
    CommonApiRequest<OperationsService.GenerateBrokerReportResult> {
        .init {
            try $0.operations.generateBrokerReport(accountId: accountId, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения брокерского отчёта.
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getBrokerReport(taskId: String, page: Int32) -> CommonApiRequest<BrokerReport> {
        .init {
            try $0.operations.getBrokerReport(taskId: taskId, page: page)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для формирования отчёта "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func generateDivForeignIssuerReport(accountId: String, from: Date, to: Date) ->
    CommonApiRequest<OperationsService.GenerateDividendsForeignIssuerReportResult> {
        .init {
            try $0.operations.generateDivForeignIssuerReport(accountId: accountId, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения отчёта "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getDivForeignIssuerReport(taskId: String, page: Int32) -> CommonApiRequest<DividendsForeignIssuerReport> {
        .init {
            try $0.operations.getDivForeignIssuerReport(taskId: taskId, page: page)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения списка операций по счёту с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - cursor: Идентификатор элемента, с которого формируется начало списка.
    ///     - limit: Лимит количества операций. По умолчанию устанавливается значение 100, максимальное значение 1000.
    ///     - types: Типы операций.
    ///     - state: Статус запрашиваемых операций.
    ///     - withCommissions: Включить комиссии.
    ///     - withTrades: Включить массив сделок.
    ///     - withOvernights: Вкличить overnight операции.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) -> CommonApiRequest<OperationsByCursor> {
        .init {
            try $0.operations.getOperationsByCursor(
                accountId: accountId, instrumentId: instrumentId, from: from, to: to, cursor: cursor,
                limit: limit, types: types, state: state, withCommissions: withCommissions,
                withTrades: withTrades, withOvernights: withOvernights
            )
        }
    }
    
    // MARK: Сервис работы с торговыми поручениями.
    
    /// Возвращает экземпляр `CommonApiRequest` для выставления биржевой заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func postOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) -> CommonApiRequest<OrderInfo> {
        .init {
            try $0.orders.postOrder(
                accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
                type: type, direction: direction, price: price, quantity: quantity
            )
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для отмены биржевой заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func cancelOrder(accountId: String, orderId: String) -> CommonApiRequest<Date> {
        .init {
            try $0.orders.cancelOrder(accountId: accountId, orderId: orderId)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения статуса биржевой заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getOrderState(accountId: String, orderId: String) -> CommonApiRequest<OrderInfo> {
        .init {
            try $0.orders.getOrderState(accountId: accountId, orderId: orderId)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения Получает список активных заявок по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта пользователя.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getOrders(accountId: String) -> CommonApiRequest<[OrderInfo]> {
        .init {
            try $0.orders.getOrders(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения изменения выставленной заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///     - orderRequestId: Новый идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - price: Цена за 1 инструмент.
    ///     - priceType: Тип цены.
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func replaceOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) -> CommonApiRequest<OrderInfo> {
        .init {
            try $0.orders.replaceOrder(
                accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
                price: price, priceType: priceType, quantity: quantity
            )
        }
    }
    
    // MARK: Сервис работы со стоп-ордерами.
    
    /// Возвращает экземпляр `CommonApiRequest` для выставления стоп-заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - quantity: Количество лотов.
    ///     - price: Цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    ///     - stopPrice: Стоп-цена заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    ///     - direction: Направление операции.
    ///     - stopOrderType: Тип заявки.
    ///     - expirationType: Тип экспирации заявки.
    ///     - expireDate: Дата и время окончания действия стоп-заявки в часовом поясе UTC (для expirationType = .goodTillDate заполнение обязательно).
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func postStopOrder(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date?
    ) -> CommonApiRequest<String> {
        .init {
            try $0.stopOrders.postStopOrder(
                accountId: accountId, instrumentId: instrumentId, quantity: quantity, price: price,
                stopPrice: stopPrice, direction: direction, stopOrderType: stopOrderType,
                expirationType: expirationType, expireDate: expireDate
            )
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения списка активных стоп-заявок по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта пользователя.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func getStopOrders(accountId: String) -> CommonApiRequest<[StopOrder]> {
        .init {
            try $0.stopOrders.getStopOrders(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для отмены стоп-заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - stopOrderId: Идентификатор стоп-заявки.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func cancelStopOrder(accountId: String, stopOrderId: String) -> CommonApiRequest<Date> {
        .init {
            try $0.stopOrders.cancelStopOrder(accountId: accountId, stopOrderId: stopOrderId)
        }
    }
}
