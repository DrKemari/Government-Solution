#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72029 "Environmental Studies"
{
    ApplicationArea = Basic;
    CardPageID = "Environmenta Study Card";
    PageType = List;
    SourceTable = "Road Study_Survey";
    SourceTableView = where("Study/Survey Type" = filter("Environmental Study"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field("Study/Survey Type"; Rec."Study/Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study/Survey Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Road Asset ID"; Rec."Road Asset ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Asset ID field.';
                }
                field("All Road Sections"; Rec."All Road Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the All Road Sections field.';
                }
                field("Primary Execution Approach"; Rec."Primary Execution Approach")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Execution Approach field.';
                }
                field("Study Abstract"; Rec."Study Abstract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Abstract field.';
                }
                field("Primary Funding Agency ID"; Rec."Primary Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Funding Agency ID field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Funding Agency Contacts"; Rec."Funding Agency Contacts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Agency Contacts field.';
                }
                field("Funding Agency Name"; Rec."Funding Agency Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Agency Name field.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Person Responsible field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
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
                field("Total Distance (KM)"; Rec."Total Distance (KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Distance (KM) field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 field.';
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate ID field.';
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Study Admin Officer ID"; Rec."Study Admin Officer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Admin Officer ID field.';
                }
                field("Admin Officer Name"; Rec."Admin Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Admin Officer Name field.';
                }
                field("Study Finance Officer ID"; Rec."Study Finance Officer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Finance Officer ID field.';
                }
                field("Total Approved Budget (LCY)"; Rec."Total Approved Budget (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Approved Budget (LCY) field.';
                }
                field("Regional Director Name"; Rec."Regional Director Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Director Name field.';
                }
                field("Regional Director ID"; Rec."Regional Director ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Director ID field.';
                }
                field("Study Finance Officer Name"; Rec."Study Finance Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Finance Officer Name field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Study/Survey Type" := Rec."study/survey type"::"Environmental Study";
    end;
}

#pragma implicitwith restore

