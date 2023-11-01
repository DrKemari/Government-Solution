#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69338 "Advertised Vacancies"
{
    CardPageID = Vacancyv1;
    PageType = List;
    SourceTable = Vacancy1;
    SourceTableView = where(Status = filter(Advertised));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Type of Contract"; Rec."Type of Contract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Contract field.';
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
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Qty field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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

