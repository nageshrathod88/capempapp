namespace epm.customAspects;

type Gender : String(4) enum {
    male = 'M';
    female = 'F';
    other = 'O';
    noDisclosure = 'N'
}

//assert.format us used for the validation.

type PHONENUMBER : String(10)@assert.format : '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';

type EMAIL : String(225)@assert.format : '^[a-zA-Z0-9_.±]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$';


type AmountType : Decimal(15, 2);

aspect Amount {
    CURRENCY_CODE: String(4);
    GROSS_AMOUNT: AmountType;
    NET_AMOUNT: AmountType;
    TAX_AMOUNT: AmountType;
}


