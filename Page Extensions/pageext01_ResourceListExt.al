pageextension 50101 "CSD ResourceListExt" extends "Resource List"
// CSD1.00 - 2021-02-11 - Torben Christensen
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(Type)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
                ApplicationArea = All;
            }
            field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
            {
                Visible = ShowMaxField;
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ShowType := (Rec.Getfilter(Rec.Type) = '');
        ShowMaxField := (Rec.Getfilter(Rec.Type) = format(Rec.Type::Machine))
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        ShowType: Boolean;
}