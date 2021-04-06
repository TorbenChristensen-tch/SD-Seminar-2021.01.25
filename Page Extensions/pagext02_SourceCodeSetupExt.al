pageextension 50102 "CSD SourceCodeSetupExt" extends "Source Code Setup"
// CSD1.00 - 2021-03-09 - Torben Christensen
// Chapter 7 - Lab 1-8
// Added new field: CSD Seminar
{
    layout
    {
        addafter("Cost Accounting")
        {
            group("CSD SeminarGroup")
            {
                Caption = 'Seminar';
                field("CSD Seminar"; rec."CSD Seminar")
                {

                }
            }

        }
    }
}