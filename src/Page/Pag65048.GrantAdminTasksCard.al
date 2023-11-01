#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65048 "Grant Admin Tasks Card"
{
    PageType = Card;
    SourceTable = "Grant Admin Tasks";
    SourceTableView = where("Source Document Type" = const(" "));

    layout
    {
        area(content)
        {
            group(General)
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
                    Enabled = false;
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
                    Editable = false;
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
                field("Contact Company Name"; Rec."Contact Company Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Company Name field.';
                }
                field(Recurring; Rec.Recurring)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recurring field.';
                }
                field("Recurring Date Interval"; Rec."Recurring Date Interval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recurring Date Interval field.';
                }
                field("Calc. Due Date From"; Rec."Calc. Due Date From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calc. Due Date From field.';
                }
                field("Application Title"; Rec."Application Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Title field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Last Time Modified"; Rec."Last Time Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Time Modified field.';
                }
                field("All Day Event"; Rec."All Day Event")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the All Day Event field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Completed By"; Rec."Completed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completed By field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field("Reminder Due Date Formular"; Rec."Reminder Due Date Formular")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reminder Due Date Formular field.';
                }
                field("Reminder Due Date"; Rec."Reminder Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reminder Due Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control43; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control44; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control45; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Source Document Type" := Rec."source document type"::" ";
    end;

    trigger OnOpenPage()
    begin
        Rec."Source Document Type" := Rec."source document type"::" ";
    end;
}

#pragma implicitwith restore

