tableextension 50100 "CSD ResourceExt" extends Resource
// CSD1.00 - 2021-02-09 - Torben Christensen
{

    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                Rec.TestField("Unit Cost");
            end;
        }
        field(50101; "CSD Resource Type"; Option)
        {
            Caption = 'Resource Type';
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
            DataClassification = AccountData;
        }
        field(50102; "CSD Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = AccountData;
        }
        field(50103; "CSD Quantity per Day"; Decimal)
        {
            Caption = 'Quantity per Day';
            DataClassification = AccountData;
        }
    }
}