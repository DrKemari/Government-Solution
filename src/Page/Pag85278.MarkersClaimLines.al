#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85278 "Markers Claim Lines"
{
    PageType = ListPart;
    SourceTable = "Markers Claim Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Code field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field("Marker No"; Rec."Marker No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Marker No field.';
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Marker Name field.';
                }
                field("No. of Expected Marked Scripts"; Rec."No. of Expected Marked Scripts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Expected Marked Scripts field.';
                }
                field("No of Scripts Marked"; Rec."No of Scripts Marked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Scripts Marked field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Marker Claim Details")
            {
                ApplicationArea = Basic;
                RunObject = Page "Marker Claim Details";
                RunPageLink = "Document No." = field("Document No."),
                              "Paper Code" = field("Paper Code");
                ToolTip = 'Executes the Marker Claim Details action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("No. of Expected Marked Scripts");
        if Rec."No of Scripts Marked" = 0 then begin
            Rec."No of Scripts Marked" := Rec."No. of Expected Marked Scripts";
            Rec.Validate("No of Scripts Marked");
            Rec.Modify(true);
        end
    end;
}

#pragma implicitwith restore

