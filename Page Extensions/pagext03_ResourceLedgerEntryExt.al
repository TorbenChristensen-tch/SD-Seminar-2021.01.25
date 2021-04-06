pageextension 50103 "CSD ResourceLedgerEntryExt" extends "Resource Ledger Entries"
// CSD1.00 - 2021-03-16 - Torben Christensen
// Chapter 7 - Lab 4-3
// Added field: Seminar No.
// Added field: Seminar Registration No.
{
    layout
    {
        addlast(content)
        {
            field("Seminar No."; Rec."CSD Seminar No.")
            {

            }
            field("Seminar Registration No."; Rec."CSD Seminar Registration No.")
            {

            }
        }
    }
}