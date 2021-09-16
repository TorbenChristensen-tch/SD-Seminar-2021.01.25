page 50141 "CSD My Seminars"
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 10 - Lab 1 - 4
// - Created new page
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD My Seminar";
    Caption = 'My Seminars';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;

                }
                field("Seminar Name"; Seminar."Name")
                {
                    ApplicationArea = all;
                }
                field("Seminar Duration"; Seminar."Seminar Duration")
                {
                    ApplicationArea = all;
                }
                field("Seminar Price"; Seminar."Seminar Price")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    OpenSeminarCard;
                end;
            }
        }
    }
    var
        Seminar: Record "CSD Seminar";

    trigger OnOpenPage()
    begin
        rec.setrange("user id", UserId)
    end;

    trigger Onaftergetrecord()
    begin
        if Seminar.get(rec."Seminar No.") then;
    end;

    trigger onNewRecord(BelowxRec: Boolean)
    begin
        clear(Seminar);
    end;

    local procedure OpenSeminarCard()
    begin
        if Seminar."No." <> '' then
            Page.Run(Page::"CSD Seminar Card", Seminar);
    end;
}