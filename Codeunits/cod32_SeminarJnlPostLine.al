codeunit 50132 "CSD Seminar Jnl-Post Line"
// CSD1.00 - 2021-03-09 - Torben Christensen
// Chapter 7 - Lab 2-8
{
    TableNo = "CSD Seminar Journal Line";
    trigger OnRun()
    begin

    end;

    var
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        SeminarRegister: Record "CSD Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-Check Line";

    procedure RunWithCheck(var SeminarJnlLine2: Record "CSD Seminar Journal Line");
    var
        myInt: Integer;
    begin
        SeminarJnlLine := SeminarJnlLine2;
        Code();
        SeminarJnlLine2 := SeminarJnlLine;
    end;

    local procedure Code();
    var
        NextEntryNo: Integer;
    begin
        if SeminarJnlLine.EmptyLine then
            exit;
        SeminarJnlCheckLine.RunCheck(SeminarJnlLine);
        if SeminarLedgerEntry.findlast then
            NextEntryNo := SeminarLedgerEntry."Entry No."
        else
            NextEntryNo := 0;
        NextEntryNo := NextEntryNo + 1;
        if SeminarJnlLine."Document Date" = 0D then
            SeminarJnlLine."Document Date" := SeminarJnlLine."Posting Date";
        if SeminarRegister."No." = 0 then begin
            SeminarRegister.LockTable();
            if (not SeminarRegister.FindLast) or
               (SeminarRegister."To Entry No." <> 0) then begin
                SeminarRegister.INIT;
                SeminarRegister."No." := SeminarRegister."No." + 1;
                SeminarRegister."From Entry No." := NextEntryNo;
                SeminarRegister."To Entry No." := NextEntryNo;
                SeminarRegister."Creation Date" := TODAY;
                SeminarRegister."Source Code" := SeminarJnlLine."Source Code";
                SeminarRegister."Journal Batch Name" := SeminarJnlLine."Journal Batch Name";
                SeminarRegister."User ID" := USERID;
                SeminarRegister.Insert;
            end;
            SeminarRegister."To Entry No." := NextEntryNo;
            SeminarRegister.Modify();
            SeminarLedgerEntry.INIT;
            SeminarLedgerEntry."Seminar No." := SeminarJnlLine."Seminar No.";
            SeminarLedgerEntry."Posting Date" := SeminarJnlLine."Posting Date";
            SeminarLedgerEntry."Document Date" := SeminarJnlLine."Document Date";
            SeminarLedgerEntry."Entry Type" := SeminarJnlLine."Entry Type";
            SeminarLedgerEntry."Document No." := SeminarJnlLine."Document No.";
            SeminarLedgerEntry.Description := SeminarJnlLine.Description;
            SeminarLedgerEntry."Bill-to Customer No." := SeminarJnlLine."Bill-to Customer No.";
            SeminarLedgerEntry."Charge Type" := SeminarJnlLine."Charge Type";
            SeminarLedgerEntry.Type := SeminarJnlLine.Type;
            SeminarLedgerEntry.Quantity := SeminarJnlLine.Quantity;
            SeminarLedgerEntry."Unit Price" := SeminarJnlLine."Unit Price";
            SeminarLedgerEntry."Total Price" := SeminarJnlLine."Total Price";
            SeminarLedgerEntry."Participant Contact No." := SeminarJnlLine."Participant Contact No.";
            SeminarLedgerEntry."Participant Name" := SeminarJnlLine."Participant Name";
            SeminarLedgerEntry.Chargeable := SeminarJnlLine.Chargeable;
            SeminarLedgerEntry."Room Resource No." := SeminarJnlLine."Room Resource No.";
            SeminarLedgerEntry."Instructor Resource No." := SeminarJnlLine."Instructor Resource No.";
            SeminarLedgerEntry."Starting Date" := SeminarJnlLine."Starting Date";
            SeminarLedgerEntry."Seminar Registration No." := SeminarJnlLine."Seminar Registration No.";
            SeminarLedgerEntry."Res. Ledger Entry No." := SeminarJnlLine."Res. Ledger Entry No.";
            SeminarLedgerEntry."Source Type" := SeminarJnlLine."Source Type";
            SeminarLedgerEntry."Source No." := SeminarJnlLine."Source No.";
            SeminarLedgerEntry."Journal Batch Name" := SeminarJnlLine."Journal Batch Name";
            SeminarLedgerEntry."Source Code" := SeminarJnlLine."Source Code";
            SeminarLedgerEntry."Reason Code" := SeminarJnlLine."Reason Code";
            SeminarLedgerEntry."Posting No. Series" := SeminarJnlLine."Posting No. Series";
            SeminarLedgerEntry."Entry No." := NextEntryNo;
            NextEntryNo += 1;
            SeminarLedgerEntry.Insert
        end;
    end;
}