codeunit 50134 "CSD Seminar Reg.-Show Ledger"
// CSD1.00 - 2021-03-11 - Torben Christensen
// Chapter 7 - Lab 2-10
{
    TableNo = "CSD Seminar Register";
    trigger OnRun()
    begin
        SeminarLedgerEntry.SETRANGE("Entry No.", rec."From Entry No.", rec."To Entry No.");
        page.Run(Page::"CSD Seminar Ledger Entries", SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
}