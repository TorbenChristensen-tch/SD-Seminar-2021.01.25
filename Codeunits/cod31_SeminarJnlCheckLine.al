codeunit 50131 "CSD Seminar Jnl.-Check Line"
// CSD1.00 - 2021-03-09 - Torben Christensen
// Chapter 7 - Lab 2-1
// Added new field: CSD Seminar
{
    TableNo = "CSD Seminar Journal Line";
    trigger OnRun()
    begin
        RunCheck(Rec);
    end;

    var
        GLSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        ClosingDateTxt: Label 'Cannot be closing date.';
        PostingDateTxt: Label 'Is not within your range of allowed posting dates';

    procedure RunCheck(var SemJnlLine: Record "CSD Seminar Journal Line")
    var
        myInt: Integer;
    begin
        if SemJnlLine.EmptyLine then
            exit;
        SemJnlLine.Testfield("posting Date");
        SemJnlLine.TestField("Instructor Resource No.");
        SemJnlLine.TestField("Seminar No.");
        case SemJnlLine."Charge Type" of
            SemjnlLine."Charge Type"::Room:
                SemJnlLine.TestField("Room Resource No.");
            SemJnlLine."Charge Type"::Participant:
                SemJnlLine.TestField("Participant Contact No.");
        end;
        If SemJnlLine.Chargeable then
            SemJnlLine.TestField("Bill-to Customer No.");
        if SemJnlLine."Posting Date" = ClosingDate(SemJnlLine."Posting Date") then
            SemJnlLine.FieldError("Posting Date", PostingDateTxt);
        if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
            if UserId <> '' then
                if UserSetup.GET(UserId) then begin
                    AllowPostingFrom := UserSetup."Allow Posting From";
                    AllowPostingTo := UserSetup."Allow Posting To";
                end;
            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D)
            then begin
                GLSetup.GET;
                AllowPostingFrom := GLSetup."Allow Posting From";
                AllowPostingTo := GLSetup."Allow Posting To";
            end;
            if AllowPostingTo = 0D then
                AllowPostingTo := DMY2Date(31, 12, 9999);
        end;
        if (SemJnlLine."Posting Date" < AllowPostingFrom) OR
        (SemJnlLine."Posting Date" > AllowPostingTo) then
            SemJnlLine.FieldError("Posting Date", PostingDateTxt);
        if (SemJnlLine."Document Date" <> 0D) then
            if (SemJnlLine."Document Date" = CLOSINGDATE(SemJnlLine."Document Date")) then
                SemJnlLine.FIELDERROR("Document Date", PostingDateTxt);
    end;
}