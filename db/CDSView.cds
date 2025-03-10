namespace epm.db;

using { epm.db.master, epm.db.transaction } from './datamodel';

context CDSView {
    define view ![PODetails]
    as select from transaction.purchaseorder {
        key PO_ID as ![purchaseorder],
            PARTNER_GUID.BP_ID as ![VendorID],
            PARTNER_GUID.COMPANY_NAME as ![companyname],
            GROSS_AMOUNT as ![POGrossamount],
            CURRENCY_CODE as ![POCurrency],
            key Items.PO_ITEM_POS as ![ItemPosition],
                Items.PRODCUT_GUID.PRODCUT_ID as ![ProductID],
                Items.PRODCUT_GUID.DESCRIPTION as ![ProductDec],
                PARTNER_GUID.ADDRESS_GUID.CITY as ![City],
                PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![County],
                Items.GROSS_AMOUNT as ![ItemGrossAmount],
                Items.NET_AMOUNT as ![ItemNetAmount]
    }   

//another view
define view ![ItemView]
as select from transaction.poitems {
    key PARTNER_KEY.PARTNER_GUID.NODE_KEY as ![VendorID],
        PRODCUT_GUID.NODE_KEY as ![ProductID],
        CURRENCY_CODE as ![Currencycode],
        NET_AMOUNT as ![netAmount],
        TAX_AMOUNT as ![TaxAmount],
        PARTNER_KEY.OVERALL_STATUS as ![POStatus]
}

//using Aggregation

define view ProductSum
as select from master.product as prod {
    key PRODCUT_ID as ![ProductId],
        texts.DESCRIPTION as ![Description],
        (select from transaction.poitems as a {
            SUM(a.GROSS_AMOUNT) as SUM
        } where a.PRODCUT_GUID.NODE_KEY = prod.NODE_KEY
        ) as PO_SUM : Decimal(10,2)
}

}