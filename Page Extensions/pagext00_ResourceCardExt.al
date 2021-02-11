pageextension 50100 "CSD ResourceCardEx" extends "Resource Card"
// CSD1.00 - 2021-02-11 - Torben Christensen
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
                ApplicationArea = All;
            }
            field("CSD Quantity per Day"; Rec."CSD Quantity per Day")
            {
                ApplicationArea = All;
            }
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;
                field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    begin
        ShowMaxField := (Rec.Type = Rec.Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
}