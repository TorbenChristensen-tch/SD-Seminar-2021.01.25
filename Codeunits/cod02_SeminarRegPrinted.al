codeunit 50102 "CSD SeminarRegPrinted"
// Chapter 9 - Lab 1-2
// - Added Codeuni
{
    TableNo = "CSD Seminar Reg. Header";
    trigger OnRun();
    begin
        rec.Find;
        rec."No. Printed" += 1;
        rec.Modify;
        Commit;
    end;
}