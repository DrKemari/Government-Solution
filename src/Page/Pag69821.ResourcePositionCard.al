#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69821 "Resource Position Card"
{
    PageType = Card;
    SourceTable = "Company Positions";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position Category"; Rec."Position Category")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary/Job Purpose"; Rec."Executive Summary/Job Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service"; Rec."Default Terms of Service")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Academic Qualification"; Rec."Minimum Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Academic Hierarchy Code"; Rec."Academic Hierarchy Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Minimum Work Experience"; Rec."Minimum Work Experience")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Default Duty Station"; Rec."Default Duty Station")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Direct Hire Unit Cost"; Rec."Direct Hire Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Average Monthly Salary (LCY)"; Rec."Average Monthly Salary (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            part(Control50; "Position Responsibilities")
            {
                SubPageLink = "Position ID" = field("Position ID"),
                              Type = const(Responsibility);
                ApplicationArea = Basic;
            }
            part(Control46; "Position Responsibilities")
            {
                Caption = 'Job Dimensions';
                SubPageLink = "Position ID" = field("Position ID"),
                              Type = const("Job Dimensions");
                ApplicationArea = Basic;
            }
            part(Control45; "General Work Conditions")
            {
                SubPageLink = "Position ID" = field("Position ID");
                ApplicationArea = Basic;
            }
            group("Special Work Conditions")
            {
                field("Travel Frequency"; Rec."Travel Frequency")
                {
                    ApplicationArea = Basic;
                }
                field("Default Work Shift"; Rec."Default Work Shift")
                {
                    ApplicationArea = Basic;
                }
                field("Work Shift Description"; Rec."Work Shift Description")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Responsibilities"; Rec."Additional Responsibilities")
                {
                    ApplicationArea = Basic;
                }
                field("Loc Relocation/Transfers"; Rec."Loc Relocation/Transfers")
                {
                    ApplicationArea = Basic;
                }
                field("Int Relocation/Transfers"; Rec."Int Relocation/Transfers")
                {
                    ApplicationArea = Basic;
                }
                field("Qualifies for Overtime"; Rec."Qualifies for Overtime")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control21; "Position Factbox")
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Academic Qualifications")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Academic Qualifications";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Professional Qualifications")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Professional Qualificationss";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Skills & Competencies")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Skills & Competencies";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action(Experience)
            {
                ApplicationArea = Basic;
                Image = UserCertificate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page Experience;
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Ethics & Integrity")
            {
                ApplicationArea = Basic;
                Image = InteractionLog;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Ethics & Integrity";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Physical Attributes")
            {
                ApplicationArea = Basic;
                Image = PhysicalInventory;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Physical Attributes";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Position Work Condition")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "General Work Conditions";
                RunPageLink = "Position ID" = field("Position ID");
                Visible = false;
            }
        }
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Position ID", Rec."Position ID");
                    Report.Run(69602, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Image = Dimensions;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Default Dimensions";
                // RunPageLink = "Table ID" = const(27),
                //               "No." = field("No. of Terminated Contracts");
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Position Category" := Rec."position category"::Resource;
    end;
}

#pragma implicitwith restore

