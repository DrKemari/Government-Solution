#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72095 "Defect Detection&Rectificati C"
{
    PageType = Card;
    SourceTable = "Defect Detection & Rectificati";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Road Authority"; Rec."Road Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Authority field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Road Authority Code"; Rec."Road Authority Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Authority Code field.';
                }
                field("Service Level"; Rec."Service Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Level field.';
                }
                field("Service Level Category"; Rec."Service Level Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Level Category field.';
                }
                field("Service Scope"; Rec."Service Scope")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Scope field.';
                }
                field("Service Creteria"; Rec."Service Creteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Creteria field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Link Name field.';
                }
            }
            part(Control15; "Detection & Rectification Line")
            {
                SubPageLink = "Project No" = field("Project Code");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

