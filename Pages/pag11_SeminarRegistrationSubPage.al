page 50111 "CSD Seminar Reg. Subpage"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 3
    //     - Created new page

    Caption = 'Lines';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "CSD Seminar Registration Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Participant Contact No."; rec."Participant Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Participant Name"; rec."Participant Name")
                {
                    ApplicationArea = All;
                }
                field(Participated; rec.Participated)
                {
                    ApplicationArea = All;
                }
                field("Registration Date"; rec."Registration Date")
                {
                    ApplicationArea = All;
                }
                field("Confirmation Date"; rec."Confirmation Date")
                {
                    ApplicationArea = All;
                }
                field("To Invoice"; rec."To Invoice")
                {
                    ApplicationArea = All;
                }
                field(Registered; rec.Registered)
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; rec."Seminar Price")
                {
                    ApplicationArea = All;
                }
                field("Line Discount %"; rec."Line Discount %")
                {
                    ApplicationArea = All;
                }
                field("Line Discount Amount"; rec."Line Discount Amount")
                {
                    ApplicationArea = All;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

