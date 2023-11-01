#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69827 "Cadre Details Card"
{
    PageType = Document;
    SourceTable = "Cadre Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Position"; Rec."Default Position")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Position field.';
                }
                field("No of Active Employees"; Rec."No of Active Employees")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Active Employees field.';
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
            }
            part(Control12; "Cadre Position Lines")
            {
                SubPageLink = "Cadre Code" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Default Position" <> '' then begin
            CadrePositionLines.Reset;
            CadrePositionLines.SetRange("Cadre Code", Rec.Code);
            if CadrePositionLines.FindSet then begin
                CadrePositionLines.CalcSums("No of Active Employees");
                Rec."No of Active Employees" := CadrePositionLines."No of Active Employees";
                Rec.Modify(true);
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Default Position" <> '' then begin
            CadrePositionLines.Reset;
            CadrePositionLines.SetRange("Cadre Code", Rec.Code);
            if CadrePositionLines.FindSet then begin
                CadrePositionLines.CalcSums("No of Active Employees");
                Rec."No of Active Employees" := CadrePositionLines."No of Active Employees";
                Rec.Modify(true);
            end;
        end;
    end;

    var
        CadrePositionLines: Record "Cadre Position Lines";
        NoofEm: Integer;
}

#pragma implicitwith restore

