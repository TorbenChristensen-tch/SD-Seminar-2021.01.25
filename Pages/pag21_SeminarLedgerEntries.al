page 50121 "CSD Seminar Ledger Entries"
// CSD1.00 - 2021-03-09 - Torben Christensen
// Chapter 7 - Lab 2-9
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar Ledger Entry";
    Caption = 'Seminar Ledger Entries';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Entry Type"; rec."Entry Type")
                {
                    ApplicationArea = all;
                }
                field("Seminar No."; rec."Seminar No.")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Charge Type"; rec."Charge Type")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = all;
                }
                field("Total Price"; rec."Total Price")
                {
                    ApplicationArea = all;
                }
                field(Chargeable; rec.Chargeable)
                {
                    ApplicationArea = all;
                }
                field("Participant Contact No."; rec."Participant Contact No.")
                {
                    ApplicationArea = all;
                }
                field("Participant Name"; rec."Participant Name")
                {
                    ApplicationArea = All;
                }
                field("Instructor Resource No."; rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Room Resource No."; rec."Room Resource No.")
                {
                    ApplicationArea = all;
                }
                field("Starting Date"; rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Seminar Registration No."; rec."Seminar Registration No.")
                {
                    ApplicationArea = all;
                }
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = All;
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
}