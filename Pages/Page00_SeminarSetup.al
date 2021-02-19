page 50100 "CSD Seminat Setup"
// CSD1.00 2021.02.19 - Torben Christensen
// Chapter 5 - Lab 2-3
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    Caption = 'Seminar Setup';
    InsertAllowed = false;
    DeleteAllowed = False;
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                caption = 'Numbering';
                field("Seminar No.s"; Rec."Seminar Nos.")
                {
                    ApplicationArea = All;
                }
                field("Seminar Registration Nos."; Rec."Seminar Registration Nos.")
                {
                    ApplicationArea = all;
                }
                field("Posted Seminar Reg, Nos."; Rec."Posted Seminar Reg. Nos.")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not rec.get then begin
            rec.init;
            rec.Insert;
        end;
    end;
}