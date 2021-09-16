report 50101 "“CSD SeminarRegParticipantList"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/SeminarRegParticipantList.rdl';
    ApplicationArea = All;
    Caption = 'Seminar Reg.- Participant List';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Seminar Registration Header"; "CSD Seminar Reg. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Seminar No.";
            column(No_; "No.")
            {
                IncludeCaption = True;
            }
            column(Seminar_No; "Seminar No.")
            {
                IncludeCaption = true;
            }
            column(Seminar_Name; "Seminar Name")
            {
                IncludeCaption = True;
            }
            column(Starting_Date; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Duration_; "Duration")
            {
                IncludeCaption = True;
            }
            column(Instructor_Name; "Instructor Name")
            {
                IncludeCaption = True;
            }
            column(Room_No; "Room Name")
            {
                IncludeCaption = true;
            }
            dataitem("Seminar Registration Line"; "CSD Seminar Registration Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(Bill_To_Customer_No_; "Bill-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(Participant_Contact_No_; "Participant Contact No.")
                {
                    IncludeCaption = True;
                }
                column(Participants_Name; "Participant Name")
                {
                    IncludeCaption = true;
                }
            }
        }
        dataitem("Company Information"; "Company Information")
        {
            column(Company_Name; Name)
            {

            }
        }
    }
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Registration List';
    }
}