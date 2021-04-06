tableextension 50103 "CSD ResourceLedgerEntryExt" extends "Res. Ledger Entry"
// CSD1.00 - 2021-03-16 - Torben Christensen
// Chapter 7 - Lab 4-1
// Added new field: CSD Seminar No.
// Added new field: CSD Seminar Registration No.
{
    fields
    {
        field(50100; "CSD Seminar No."; Code[20])
        {
            caption = 'Seminar No.';
            DataClassification = AccountData;
        }
        field(50101; "CSD Seminar Registration No."; Code[20])
        {
            caption = 'Seminar registration No.';
            TableRelation = "CSD Seminar Reg. Header";
            DataClassification = AccountData;
        }
    }

    var
        myInt: Integer;
}