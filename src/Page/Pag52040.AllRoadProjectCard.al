#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page All Road Project Card (ID 52040).
/// </summary>
#pragma implicitwith disable
Page 52040 "All Road Project Card"
{
    PageType = Card;
    SourceTable = "Roads Projects";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project  No"; Rec."Project  No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project  No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Road Length(km)"; Rec."Road Length(km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Length(km) field.';
                }
                field("Project Engineer"; Rec."Project Engineer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control5; "Road Project Funding Lines")
            {
                SubPageLink = "Project No." = field("Project  No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

