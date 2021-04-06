tableextension 50101 "CSD SourceCodeSetupExt" extends "Source Code Setup"
// CSD1.00 - 2021-03-09 - Torben Christensen
// Chapter 7 - Lab 1-7
// Added new field: CSD Seminar
{
    fields
    {
        field(50100; "CSD Seminar"; Code[10])
        {
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }
}