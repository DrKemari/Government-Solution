#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69337 "Closed Vacancies"
{
    CardPageID = Vacancyv1;
    PageType = List;
    SourceTable = Vacancy1;
    SourceTableView = where(Status = filter(Closed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Qty field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Start Date field.';
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual End Date field.';
                }
                field("Applications End Time"; Rec."Applications End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Time field.';
                }
                field("Applications End Date"; Rec."Applications End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Date field.';
                }
                field("Applications Start Date"; Rec."Applications Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications Start Date field.';
                }
                field(Advertise; Rec.Advertise)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertise field.';
                }
                field("Advertised By"; Rec."Advertised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertised By field.';
                }
                field("Advertised Date"; Rec."Advertised Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertised Date field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Closed Date"; Rec."Closed Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed Date field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Type of Contract"; Rec."Type of Contract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Contract field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

