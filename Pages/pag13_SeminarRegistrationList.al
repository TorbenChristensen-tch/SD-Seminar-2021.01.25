page 50113 "CSD Seminar Registration List"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 3
    //     - Created new page
    // Chapter 7 - Lab 4-8
    // Added Action Post

    Caption = 'Seminar Registration List';
    CardPageID = "CSD Seminar Registration";
    Editable = false;
    PageType = List;
    SourceTable = "CSD Seminar Reg. Header";
    UsageCategory = lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Seminar No."; rec."Seminar No.")
                {
                    ApplicationArea = All;
                }
                field("Seminar Name"; rec."Seminar Name")
                {
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Duration; rec.Duration)
                {
                    ApplicationArea = All;
                }
                field("Maximum Participants"; rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }
                field("Room Resource No."; rec."Room Resource No.")
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

    actions
    {
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page 50106;
                    RunPageLink = "No." = Field("No.");
                    RunPageView = where("Table Name" = Const("Seminar Registration Header"));
                    ApplicationArea = All;
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page 50124;
                    RunPageLink = "Document No." = Field("No.");
                    ApplicationArea = All;
                }
                action("&Post")
                {
                    Caption = '&Post';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    ShortcutKey = F9;
                    RunObject = codeunit "CSD Seminar-Post (Yes/No)";
                }
            }
        }
    }
}