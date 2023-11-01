#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 52032 "Open Road Projects"
{
    ApplicationArea = Basic;
    CardPageID = "Open Road  Project Card";
    Editable = false;
    PageType = List;
    SourceTable = "Roads Projects";
    SourceTableView = where(Status = const(Open));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project  No"; Rec."Project  No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project  No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact No. field.';
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

