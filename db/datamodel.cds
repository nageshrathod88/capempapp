namespace epm.db;

using {cuid, managed} from '@sap/cds/common';
using {epm.customAspects} from './customAspects';


context master {        
    entity businesspartner : managed {
      key  NODE_KEY : String(50) @title : '{i18n>NODE_KEY}';
        BP_ROLE : Integer @title : '{i18n>BP_ROLE}';
        EMAIL_ADDRESS : String(50) @title : '{i18n>EMAIL_ADDRESS}';
        PHONE_NUMBER : Integer @title : '{i18n>PHONE_NUMBER}';
        FAX_NUMBER : Integer @title : '{i18n>FAX_NUMBER}';
        WEB_ADDRESS : String(100) @title : '{i18n>WEB_ADDRESS}';
        ADDRESS_GUID : Association to one address @title : '{i18n>ADDRESS_GUID}';    
        BP_ID : Integer @title : '{i18n>BP_ID}' ;
        COMPANY_NAME : String(30) @title : '{i18n>COMPANY_NAME}';
    }
    entity worker : cuid, managed {       
            FIRSTNAME   : String(30);
            LASTNAME : String(30);
            GENDER  : customAspects.Gender;
            PHONENUMBER : customAspects.PHONENUMBER;
            EMAIL   :   customAspects.EMAIL;
            CURRENCY_CODE   :   String(30);
            SALARYAMOUNT    :   Decimal(15, 2);
    }   
    entity address {
        key NODE_KEY : String(50);
            CITY       : String(44);
            POSTAL_CODE :   String(8);
            STREET  :   String(44);
            BUILDING    :   String(128);
            COUNTRY     :   String(44);
            ADDRESS_TYPE    :   String(44);
            VAL_START_DATE  :   Date;
            VAL_END_DATE    :   Date;
            LATITUDE    :   Decimal;
            LONGITUDE   :   Decimal;            
            businesspartner : Association to one businesspartner on businesspartner.ADDRESS_GUID = $self;
    }
    entity product {
        key NODE_KEY : String(50);
            PRODCUT_ID : String(28);
            TYPE_CODE    : String(2);
            CATEGORY : String(32);
            DESCRIPTION : localized String(255);
            SUPPLIER_GUID   : Association to one businesspartner;
            TAX_TARIF_CODE  : Integer;
            MEASURE_UNIT    : String(2);
            WEIGHT_MEASURE : Decimal;
            WEIGHT_UNIT : String(2);
            CURRENCY_CODE : String(4);
            PRICE : Decimal;
            WIDTH : Decimal;
            DEPTH : Decimal;
            HEIGHT : Decimal;
            DIM_UNIT : String(2);
    }
}

context transaction {
    entity purchaseorder : customAspects.Amount {
        key NODE_KEY    :   String(50);
            PO_ID       :   String(24);
            PARTNER_GUID:   Association to master.businesspartner;
            LIFECYCLE_STATUS: String(1);
            OVERALL_STATUS: String(1);
            Items       : Association to many poitems on Items.PARTNER_KEY = $self;
    }
    entity poitems : customAspects.Amount {
        key NODE_KEY : String(50);
            PARTNER_KEY : Association to one purchaseorder;
            PO_ITEM_POS : Integer;
            PRODCUT_GUID    : Association to one master.product;
    }
}
