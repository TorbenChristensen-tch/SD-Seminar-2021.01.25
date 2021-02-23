page 50107 "CSD Seminar Comment List"
// CSD1.00 2021.02.23 Torben Christensen
// Chapter 5 - Lab 5.3 
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Date; rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Code; rec.Code)
                {
                    ApplicationArea = All;
                    Visible = False;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
