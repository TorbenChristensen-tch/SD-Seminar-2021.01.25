page 50101 "CSD Seminar Card"
// CSD1.00 2021.02.19 - Torben Christensen
// Chapter 5 - Lab 2-4 and 2-5
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar";
    caption = 'Seminar';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Genereal';
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                    AssistEdit = true;
                    trigger Onassistedit()
                    begin
                        If rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = all;
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = all;
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = all;
                }
                field("Maximum Participants"; rec."Maximum Participants")
                {
                    ApplicationArea = all;
                }
                field(Blocked; rec.Blocked)
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
            }
            group(Invoicing)
            {
                caption = 'Invoicing';
                field("Gen. Prod.Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Seminar Price"; rec."Seminar Price")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
            {
                Caption = 'Links';
            }
            systempart("Notes"; Notes)
            {
                Caption = 'Notes';
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                Caption = '&Seminar';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    // RunObject = Page "CSD Seminar Comment Sheet";
                    // RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = True;
                    PromotedOnly = True;
                    ApplicationArea = All;
                }
            }
        }
    }
}