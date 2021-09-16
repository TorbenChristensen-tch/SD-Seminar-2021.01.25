table 50141 "CSD My Seminar"
{
    caption = 'My Seminar';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'User ID';
            TableRelation = User;
        }
        field(20; "Seminar No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
        }
    }

    keys
    {
        key(PK; "User ID", "Seminar No.")
        {
            Clustered = true;
        }
    }
}