page 50140 "CSD Seminar Manager Activities"
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 10 - Lab 1 - 2
// - Created new page
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Cue";
    caption = 'Seminar Manager Activities';
    editable = False;
    layout
    {
        area(Content)
        {
            cuegroup(Registrations)
            {
                Caption = 'Registrations';
                field(Planned; rec.Planned)
                {
                    ApplicationArea = All;

                }
                field(Registered; rec.Registered)
                {
                    ApplicationArea = all;
                }
                actions
                {
                    action(New)
                    {
                        caption = 'New';
                        RunObject = page "CSD Seminar Registration";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("For Posting")
            {
                caption = 'For Posting';
                field(Closed; rec.Closed)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    trigger OnOpenPage();
    begin
        if not rec.get then begin
            rec.init;
            rec.insert;
        end;
    end;
}