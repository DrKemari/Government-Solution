#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72104 "Payment Reduction Calculationc"
{
    PageType = Card;
    SourceTable = "Payment Reduction Calculation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Road Authority Code"; Rec."Road Authority Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Authority Code field.';
                }
                field("Road Authority Name"; Rec."Road Authority Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Authority Name field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road/Link Name"; Rec."Road/Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road/Link Name field.';
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Chainage(Km)"; Rec."Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage(Km) field.';
                }
                field("Length(Km)"; Rec."Length(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Length(Km) field.';
                }
                field("Statement Month"; Rec."Statement Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statement Month field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Elapse Of Month"; Rec."Elapse Of Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Elapse Of Month field.';
                }
                field("Standard Service Level"; Rec."Standard Service Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standard Service Level field.';
                }
                field("Contract Period(M)"; Rec."Contract Period(M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Period(M) field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Due Amount Of the Month"; Rec."Due Amount Of the Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Amount Of the Month field.';
                }
            }
            part(Control21; "Payment Red. Calc. Line")
            {
                SubPageLink = "Project Code" = field("Project No");
                ApplicationArea = Basic;
            }
            part(Control22; "Payment Reduction Required Tar")
            {
                SubPageLink = "Project No" = field("Project No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

