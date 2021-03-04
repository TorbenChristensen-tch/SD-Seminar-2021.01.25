table 50104 "CSD Seminar Comment Line"
// CSD1.00 2021.02.23 Torben Christensen
// Chapter 5 - Lab 5.3
{
    caption = 'Seminar Comment Line';
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";
    DataClassification = AccountData;

    fields
    {
        field(10; "Table Name"; Option)
        {
            OptionMembers = Seminar,"Seminar Registration Header","Posted Seminar Reg. Header";
            OptionCaption = 'Seminar,Seminar Registration,Posted Seminar Registration';
            Caption = 'Table Name';
            DataClassification = AccountData;

        }
        field(20; "Document Line No."; Integer)
        {
            caption = 'Document Line No.';
            DataClassification = AccountData;
        }
        field(30; "No."; Code[20])
        {
            Caption = 'No.".';
            TableRelation = IF ("Table Name" = Const(Seminar)) "CSD Seminar";
            DataClassification = AccountData;
        }
        field(40; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = AccountData;
        }
        field(50; "Date"; Date)
        {
            caption = 'Date';
            DataClassification = AccountData;
        }
        field(60; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = AccountData;
        }
        field(70; Comment; Text[80])
        {
            Caption = 'Comment';
            DataClassification = AccountData;
        }
    }

    keys
    {
        key(PK; "Table Name", "Document Line No.", "No.", "Line No.")
        {
            Clustered = true;
        }
    }
}