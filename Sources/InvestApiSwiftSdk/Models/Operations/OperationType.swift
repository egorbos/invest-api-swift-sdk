/// Тип операции.
public enum OperationType: Int, Codable {
    /// Тип операции не определён.
    case unspecified

    /// Пополнение брокерского счёта.
    case input

    /// Удержание НДФЛ по купонам.
    case bondTax

    /// Вывод ЦБ.
    case outputSecurities

    /// Доход по сделке РЕПО овернайт.
    case overnight

    /// Удержание налога.
    case tax

    /// Полное погашение облигаций.
    case bondRepaymentFull

    /// Продажа ЦБ с карты.
    case sellCard

    /// Удержание налога по дивидендам.
    case dividendTax

    /// Вывод денежных средств.
    case output

    /// Частичное погашение облигаций.
    case bondRepayment

    /// Корректировка налога.
    case taxCorrection

    /// Удержание комиссии за обслуживание брокерского счёта.
    case serviceFee

    /// Удержание налога за материальную выгоду.
    case benefitTax

    /// Удержание комиссии за непокрытую позицию.
    case marginFee

    /// Покупка ЦБ.
    case buy

    /// Покупка ЦБ с карты.
    case buyCard

    /// Перевод ценных бумаг из другого депозитария.
    case inputSecurities

    /// Продажа в результате Margin-call.
    case sellMargin

    /// Удержание комиссии за операцию.
    case brokerFee

    /// Покупка в результате Margin-call.
    case buyMargin

    /// Выплата дивидендов.
    case dividend

    /// Продажа ЦБ.
    case sell

    /// Выплата купонов.
    case coupon

    /// Удержание комиссии SuccessFee.
    case successFee

    /// Передача дивидендного дохода.
    case dividendTransfer

    /// Зачисление вариационной маржи.
    case accruingVarmargin

    /// Списание вариационной маржи.
    case writingOffVarmargin

    /// Покупка в рамках экспирации фьючерсного контракта.
    case deliveryBuy

    /// Продажа в рамках экспирации фьючерсного контракта.
    case deliverySell

    /// Комиссия за управление по счёту автоследования.
    case trackMfee

    /// Комиссия за результат по счёту автоследования.
    case trackPfee

    /// Удержание налога по ставке 15%.
    case taxProgressive

    /// Удержание налога по купонам по ставке 15%.
    case bondTaxProgressive

    /// Удержание налога по дивидендам по ставке 15%.
    case dividendTaxProgressive

    /// Удержание налога за материальную выгоду по ставке 15%.
    case benefitTaxProgressive

    /// Корректировка налога по ставке 15%.
    case taxCorrectionProgressive

    /// Удержание налога за возмещение по сделкам РЕПО по ставке 15%.
    case taxRepoProgressive

    /// Удержание налога за возмещение по сделкам РЕПО.
    case taxRepo

    /// Удержание налога по сделкам РЕПО.
    case taxRepoHold

    /// Возврат налога по сделкам РЕПО.
    case taxRepoRefund

    /// Удержание налога по сделкам РЕПО по ставке 15%.
    case taxRepoHoldProgressive

    /// Возврат налога по сделкам РЕПО по ставке 15%.
    case taxRepoRefundProgressive

    /// Выплата дивидендов на карту.
    case divExt

    /// Корректировка налога по купонам.
    case taxCorrectionCoupon
}

