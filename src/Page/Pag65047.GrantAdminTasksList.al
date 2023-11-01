#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65047 "Grant Admin Tasks List"
{
    CardPageID = "Grant Admin Tasks Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Admin Tasks";
    SourceTableView = where("Source Document Type" = const(" "));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Source Document Type field.';
                }
                field("Sourec Document No."; Rec."Sourec Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sourec Document No. field.';
                }
                field("Grant Admin Team Code"; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Admin Team Code field.';
                }
                field("Team Name"; Rec."Team Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Name field.';
                }
                field("Researcher No"; Rec."Researcher No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Researcher No field.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact No. field.';
                }
                field("Task Type"; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Type field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Program field.';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Research Center Description"; Rec."Research Center Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center Description field.';
                }
                field("Program Description"; Rec."Program Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Program Description field.';
                }
                field("Contact Company No"; Rec."Contact Company No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Company No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

