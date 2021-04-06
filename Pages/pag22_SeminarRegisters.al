page 50122 "CSD Seminar Registers"
// CSD1.00 - 2021-03-11 - Torben Christensen
// Chapter 7 - Lab 2-11

{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar Register";
    Caption = 'Seminar Register';
    Editable = False;

    layout
    {
        area(Content)
        {
            group(repeater)
            {
                field("No."; rec."No.")
                {

                }
                field("Creation Date"; rec."Creation Date")
                {

                }
                field("User ID"; rec."User ID")
                {

                }
                field("Source Code"; rec."Source Code")
                {

                }
                field("Journal Batch Name"; rec."Journal Batch Name")
                {

                }
            }
        }
        area(factboxes)
        {
            systempart("Links"; Links)
            {
                ApplicationArea = All;
            }
            systempart("Notes"; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                ApplicationArea = All;
                Image = WarrantyLedger;
                RunObject = codeunit "CSD Seminar Reg.-Show Ledger";
            }
        }
    }

    var
        myInt: Integer;
}