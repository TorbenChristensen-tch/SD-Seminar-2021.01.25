page 50102 "CSD Seminar List"
// CSD1.00 2021.02.19 - Torben Christensen
// Chapter 5 - Lab 2-6
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar List';
    Editable = False;
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            Repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; Rec."Seminar Price")
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
                    RunObject = Page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
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