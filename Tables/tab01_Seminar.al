table 50101 "CSD Seminar"
// CSD1.00 2021.02.16 Torben Christensen
// Chapter 5 - Lab 2.2
{
    Caption = 'Seminar';
    DataClassification = AccountData;
    DrillDownPageId = "CSD Seminar List";
    LookupPageId = "CSD Seminar List";

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = AccountData;
            trigger OnValidate();
            begin
                If "No." <> xRec."No." then begin
                    SeminarSetup.Get();
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = AccountData;
            trigger OnValidate();
            begin
                if (Rec."Search Name" = UpperCase(xRec."Search Name")) or
                   (Rec."Search Name" = '') then
                    rec."Search Name" := rec.Name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
            DataClassification = AccountData;
        }
        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = AccountData;
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximim Participants';
            DataClassification = AccountData;
        }
        field(60; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
            DataClassification = AccountData;
        }
        field(70; Blocked; Boolean)
        {
            CaptionClass = 'Blocked';
            DataClassification = AccountData;
        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            DataClassification = AccountData;
        }
        field(90; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            //FieldClass = FlowField;
            //CalcFormula = exist("CSD Seminar Comment Line" where("Table Name" = const("Seminar"), "No." = field("No.")));
            //DataClassification = AccountData;
        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
            DataClassification = AccountData;
        }
        field(110; "Gen. Prod.Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            DataClassification = AccountData;
            trigger onvalidate();
            begin
                if xrec."Gen. Prod.Posting Group" <> Rec."Gen. Prod.Posting Group" then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, Rec."Gen. Prod.Posting Group") then
                        Validate(Rec."VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
            DataClassification = AccountData;
        }
        field(130; "No. Series"; code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = AccountData;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key("Search Name"; "Search Name")
        { }
    }
    var
        SeminarSetup: Record "CSD Seminar Setup";
        // CommentLine : Record "CSD Seminar Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit "NoseriesManagement";

    trigger OnInsert();
    begin
        If "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    begin
        //CommentLine.Reset;
        //CommentLine.setrange("Table Name",CommentLine."Table Name"::Seminar);
        //CommentLine.setrange("No.","No.");
        // CommentLine.Deleteall;
    end;

    procedure AssistEdit(): Boolean;
    begin
        Seminar := Rec;
        SeminarSetup.get;
        SeminarSetup.TestField("Seminar Nos.");
        if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xrec."No. Series", rec."No. Series") then begin
            NoSeriesMgt.SetSeries(Rec."No.");
            Rec := Seminar;
            exit(true);
        end;
    end;
}