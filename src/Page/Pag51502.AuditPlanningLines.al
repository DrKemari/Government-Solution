#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Audit Planning Lines (ID 51502).
/// </summary>
#pragma implicitwith disable
Page 51502 "Audit Planning Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Task Type"; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Type field.';
                }
                field("Institution/Programme ID"; Rec."Institution/Programme ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution/Programme ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Programme Name"; Rec."Programme Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Name field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field("Responsible Officer"; Rec."Responsible Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer field.';
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer Name field.';
                }
                field("Planned Budget"; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Budget field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                action("Initiate Audit Process")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    ToolTip = 'Executes the Initiate Audit Process action.';
                    trigger OnAction()
                    begin
                        if Confirm(TXT001, true, Rec.Description) = true then begin
                            Rec.TestField("Responsible Officer");
                            //    AccreditationQualityAudit.CreateAuditRequest(Rec);
                        end
                    end;
                }
                action("Audit Objectives")
                {
                    ApplicationArea = Basic;
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Objectives";
                    // RunPageLink = "Audit Plan No." = field("Audit Plan Header");
                    ToolTip = 'Executes the Audit Objectives action.';
                }
                action("Audit Locations")
                {
                    ApplicationArea = Basic;
                    Image = Lock;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Locations";
                    RunPageLink = "Audit Plan No." = field("Audit Plan Header"),
                                  "Audit Task Type" = field("Task Type"),
                                  "Audit Item No." = field("Line No.");
                    ToolTip = 'Executes the Audit Locations action.';
                }
                action("Audit Procedures")
                {
                    ApplicationArea = Basic;
                    Image = Production;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Procedure";
                    RunPageLink = "Audit Plan No." = field("Audit Plan Header"),
                                  "Audit Task Type" = field("Task Type"),
                                  "Audit Item No." = field("Line No.");
                    ToolTip = 'Executes the Audit Procedures action.';
                }
                action("Audit Scope")
                {
                    ApplicationArea = Basic;
                    Image = AvailableToPromise;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Scope";
                    RunPageLink = "Audit Plan No." = field("Audit Plan Header"),
                                  "Audit Task Type" = field("Task Type"),
                                  "Audit Item No." = field("Line No.");
                    ToolTip = 'Executes the Audit Scope action.';
                }
                action("Proposed Team")
                {
                    ApplicationArea = Basic;
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Proposed Team action.';
                }
            }
        }
    }

    var
        AccreditationQualityAudit: Codeunit "Accreditation-Quality Audit";
        TXT001: label 'Initiate quality audit for the %1';
}

#pragma implicitwith restore

