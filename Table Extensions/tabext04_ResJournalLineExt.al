tableextension 50104 "CSD ResJournalLineExt" extends "Res. Journal Line"
// CSD1.00 - 2021-03-16 - Torben Christensen
// Chapter 7 - Lab 4-2
// Added new field: CSD Seminar No.
// Added new field: CSD Seminar Registration No.
{
    fields
    {
        field(50100; "CSD Seminar No."; Code[20])
        {
            caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
            DataClassification = AccountData;
        }
        field(50101; "CSD Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            TableRelation = "CSD Seminar Reg. Header";
            DataClassification = AccountData;
        }
    }

    var
        myInt: Integer;
}