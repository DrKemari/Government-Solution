#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80108 "Competency Performance Temp"
{
    PageType = Card;
    SourceTable = "Competency Per Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Proficiency Scale"; Rec."Competency Proficiency Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Proficiency Scale field.';
                }
                field("Competency Scoring Model"; Rec."Competency Scoring Model")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Scoring Model field.';
                }
                field("General Instructions"; Rec."General Instructions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Instructions field.';
                }
                field("Global?"; Rec."Global?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global? field.';
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Responsibility Center field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Total Assigned Weight %"; Rec."Total Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Assigned Weight % field.';
                }
            }
            part(Control16; "Competency Template Line")
            {
                SubPageLink = "Competency Template ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

