#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85547 "Checker Claim Lines"
{
    PageType = ListPart;
    SourceTable = "Markers Claim Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSitting;Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(MarkerNo;Rec."Marker No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(MarkerName;Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NoofExpectedMarkedScripts;Rec."No. of Expected Marked Scripts")
                {
                    ApplicationArea = Basic;
                }
                field(NoofScriptsMarked;Rec."No of Scripts Marked")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Rec.Amount)
                {
                    ApplicationArea = Basic;
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
                RunPageLink = "Document No."=field("Document No."),
                              "Paper Code"=field("Paper Code");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec."No. of Expected Marked Scripts");
        if Rec."No of Scripts Marked"=0 then begin
        Rec."No of Scripts Marked":=Rec."No. of Expected Marked Scripts";
        Rec.Validate(Rec."No of Scripts Marked");
        Rec.Modify(true);
        end
    end;
}
