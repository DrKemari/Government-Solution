#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69614 "Establishment Position"
{
    PageType = ListPart;
    SourceTable = "Establishment Plan Position";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation Group field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field("Approved No."; Rec."Approved No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Establishment';
                    ToolTip = 'Specifies the value of the Staff Establishment field.';
                }
                field("Actual Active"; Rec."Actual Active")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Headcount';
                    ToolTip = 'Specifies the value of the Current Headcount field.';
                }
                field(Variance; Rec.Variance)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Variance field.';
                }
                field("Cadre Type"; Rec."Cadre Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cadre Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Planning Lines")
            {
                Image = Journals;
                action("Manpower Planning Lines")
                {
                    ApplicationArea = Basic;
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Establishment Planning Lines";
                    RunPageLink = "Position ID" = field("Job ID"),
                                  "Primary Key" = field("Staff Establishment Code");
                    ToolTip = 'Executes the Manpower Planning Lines action.';
                    trigger OnAction()
                    begin
                        /*StaffEstablishmentPlanLines.FILTERGROUP(2);
                        StaffEstablishmentPlanLines.SETRANGE("Position ID","Job ID");
                        StaffEstablishmentPlanLines.FILTERGROUP(0);
                        StaffEstablishmentPlanLine.SETTABLEVIEW(StaffEstablishmentPlanLines);
                        StaffEstablishmentPlanLine.EDITABLE :=TRUE;
                        StaffEstablishmentPlanLine.RUN;*/

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // IF "Approved No.">0 THEN BEGIN
        // Variance:="Approved No."-"Actual Active";
        // MODIFY(TRUE);
        // END;
        if Rec."Job ID" <> '' then begin
            if Rec."Cadre Type" = Rec."cadre type"::"Common Cadre" then begin
                CadreHeader.Reset;
                CadreHeader.SetRange(Code, Rec."Cadre Code");
                if CadreHeader.FindSet then begin
                    Rec."Actual Active" := CadreHeader."No of Active Employees";
                    if Rec."Approved No." > 0 then begin
                        Rec.Variance := Rec."Approved No." - Rec."Actual Active";
                        //MODIFY(TRUE);
                    end;
                    Rec.Modify(true);
                end;
            end;
            if Rec."Cadre Type" = Rec."cadre type"::"Normal Cadre" then begin
                Employee.Reset;
                Employee.SetRange("Current Position ID", Rec."Job ID");
                Employee.SetRange(Status, Employee.Status::Active);
                if Employee.FindSet then begin
                    Rec."Actual Active" := Employee.Count;
                    if Rec."Approved No." > 0 then begin
                        Rec.Variance := Rec."Approved No." - Rec."Actual Active";
                        // MODIFY(TRUE);
                    end;
                    Rec.Modify(true);
                end;
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        TotalEstablished := 0;
        PlanLines.Reset;
        PlanLines.SetRange("Position ID", Rec."Job ID");
        if PlanLines.FindSet then begin
            repeat
                TotalEstablished := TotalEstablished + PlanLines."Optimal Staffing";
            until PlanLines.Next = 0;
        end;
        Rec."Actual Terminated" := TotalEstablished;

        if Rec."Job ID" <> '' then begin
            if Rec."Cadre Type" = Rec."cadre type"::"Common Cadre" then begin
                CadreHeader.Reset;
                CadreHeader.SetRange(Code, Rec."Cadre Code");
                if CadreHeader.FindSet then begin
                    Rec."Actual Active" := CadreHeader."No of Active Employees";
                    if Rec."Approved No." > 0 then begin
                        Rec.Variance := Rec."Approved No." - Rec."Actual Active";
                        //MODIFY(TRUE);
                    end;
                    Rec.Modify(true);
                end;
            end;
            if Rec."Cadre Type" = Rec."cadre type"::"Normal Cadre" then begin
                Employee.Reset;
                Employee.SetRange("Current Position ID", Rec."Job ID");
                Employee.SetRange(Status, Employee.Status::Active);
                if Employee.FindSet then begin
                    Rec."Actual Active" := Employee.Count;
                    if Rec."Approved No." > 0 then begin
                        Rec.Variance := Rec."Approved No." - Rec."Actual Active";
                        // MODIFY(TRUE);
                    end;
                    Rec.Modify(true);
                end;
            end;
        end;
    end;

    var
        StaffEstablishmentPlanLines: Record "Establishment Planning Line";
        StaffEstablishmentPlanLine: Page "Establishment Planning Lines";
        PlanLines: Record "Establishment Planning Line";
        TotalEstablished: Integer;
        CadreHeader: Record "Cadre Header";
        Employee: Record Employee;
}

#pragma implicitwith restore

