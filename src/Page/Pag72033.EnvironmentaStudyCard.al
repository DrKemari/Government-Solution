#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72033 "Environmenta Study Card"
{
    Caption = '<Environmental Study Card>';
    PageType = Card;
    SourceTable = "Road Study_Survey";
    SourceTableView = where("Study/Survey Type" = filter("Environmental Study"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field("NEMA Registration/Licence No"; Rec."NEMA Registration/Licence No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NEMA Registration/Licence No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Study Abstract"; Rec."Study Abstract")
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                    ToolTip = 'Specifies the value of the Objective field.';
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
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Road Works Project ID"; Rec."Road Works Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Works Project ID field.';
                }
                field("Total Approved Budget (LCY)"; Rec."Total Approved Budget (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Approved Budget (LCY) field.';
                }
                field("Total Actual Cost (LCY)"; Rec."Total Actual Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual Cost (LCY) field.';
                }
            }
            group(Funding)
            {
                Caption = 'Funding';
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
            }
            group(Responsibility)
            {
                Caption = 'Responsibility';
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
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
                field("Study Finance Officer Name"; Rec."Study Finance Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Finance Officer Name field.';
                }
                field("Regional Director ID"; Rec."Regional Director ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Director ID field.';
                }
                field("Regional Director Name"; Rec."Regional Director Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Director Name field.';
                }
            }
            part(Control31; "Road Study Task Line")
            {
                SubPageLink = "Study ID" = field("Study ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Objectives)
            {
                ApplicationArea = Basic;
                Caption = 'Objectives';
                Image = Opportunity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Objectives";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Objectives action.';
            }
            action(Relations)
            {
                ApplicationArea = Basic;
                Caption = 'Related/Collaborating Studies';
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Relations";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Related/Collaborating Studies action.';
            }
            action("Alternative Options")
            {
                ApplicationArea = Basic;
                Caption = 'Project Alternatives';
                Image = AlternativeAddress;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Alternative Options";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Project Alternatives action.';
            }
            action("Cost Benefit Analysis Matrix")
            {
                ApplicationArea = Basic;
                Image = CalculateCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Study Cost Benefit Analysis";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Cost Benefit Analysis Matrix action.';
            }
            action("Population Projections & Impacts")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Population Projections";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Population Projections & Impacts action.';
            }
            action("Mitigation Measures")
            {
                ApplicationArea = Basic;
                Image = MakeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Mitigation Measures";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Mitigation Measures action.';
            }
            action("Key Stakeholder Views")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Key Stakeholder Views";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Key Stakeholder Views action.';
            }
            action("Study Team")
            {
                ApplicationArea = Basic;
                Image = TransferOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Feasibility Study Teams";
                RunPageLink = "Feasibility Study No" = field("Study ID");
                ToolTip = 'Executes the Study Team action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Study/Survey Type" := Rec."study/survey type"::"Environmental Study";
    end;
}

#pragma implicitwith restore

