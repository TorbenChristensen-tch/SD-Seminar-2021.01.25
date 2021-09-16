page 50110 "CSD Seminar Registration"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 3-1
    //     - Created new page
    // Chapter 7 - Lab 4-8
    // Added Action Post

    Caption = 'Seminar Registration';
    PageType = Document;
    SourceTable = "CSD Seminar Reg. Header";
    UsageCategory = tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    AssistEdit = true;
                    ApplicationArea = All;
                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPDATE;
                    end;
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
                field("Instructor Resource No."; rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Instructor Name"; rec."Instructor Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; rec."Document Date")
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
                field("Minimum Participants"; rec."Minimum Participants")
                {
                    ApplicationArea = All;
                }
                field("Maximum Participants"; rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }
            part(SeminarRegistrationLines; "CSD Seminar Reg. Subpage")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
            }
            group("Seminar Room")
            {
                field("Room Resource No."; rec."Room Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Room Name"; rec."Room Name")
                {
                    ApplicationArea = All;
                }
                field("Room Address"; rec."Room Address")
                {
                    ApplicationArea = All;
                }
                field("Room Address 2"; rec."Room Address 2")
                {
                    ApplicationArea = All;
                }
                field("Room Post Code"; rec."Room Post Code")
                {
                    ApplicationArea = All;
                }
                field("Room City"; rec."Room City")
                {
                    ApplicationArea = All;
                }
                field("Room Country/Reg. Code"; rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                }
                field("Room County"; rec."Room County")
                {
                    ApplicationArea = All;
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; rec."Seminar Price")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("Seminar Details FactBox"; "CSD Seminar Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Seminar No.");
            }
            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                Provider = SeminarRegistrationLines;
                SubPageLink = "No." = field("Bill-to Customer No.");
            }
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
                action("&Print")
                {
                    Caption = '&Print';
                    Image = Print;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    trigger OnAction();
                    var
                        SeminarReportSelection: Record
 "CSD Seminar Report Selections";
                    begin
                        SeminarReportSelection.PrintReportSelection
                        (SeminarReportSelection.Usage::Registration, Rec);
                    end;
                }

            }
        }
    }
}