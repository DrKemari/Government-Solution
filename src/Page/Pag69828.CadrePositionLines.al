#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69828 "Cadre Position Lines"
{
    PageType = ListPart;
    SourceTable = "Cadre Position Lines";

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
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation Group field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("No of Active Employees"; Rec."No of Active Employees")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Active Employees field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Job ID" <> '' then begin
            Employee.Reset;
            Employee.SetRange("Current Position ID", Rec."Job ID");
            Employee.SetRange(Status, Employee.Status::Active);
            if Employee.FindSet then begin
                Rec."No of Active Employees" := Employee.Count;
                Rec.Modify(true);
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Job ID" <> '' then begin
            Employee.Reset;
            Employee.SetRange("Current Position ID", Rec."Job ID");
            Employee.SetRange(Status, Employee.Status::Active);
            if Employee.FindSet then begin
                Rec."No of Active Employees" := Employee.Count;
                Rec.Modify(true);
            end;
        end;
    end;

    var
        Employee: Record Employee;
}

#pragma implicitwith restore

