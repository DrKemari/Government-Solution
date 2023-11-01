#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85264 "Serial No Details"
{
    PageType = ListPart;
    SourceTable = "Script Envelope Serials";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Envelope Serial No."; Rec."Envelope Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Scripts"; Rec."No. of Scripts")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange("Document No.", Rec."Document No.");
        CenterDispatchLines.SetRange("Line No.", Rec."Line No.");
        CenterDispatchLines.SetRange(Posted,true);
        if CenterDispatchLines.FindSet then begin
          Error('ERROR! This Paper has already been submitted');
          end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange("Document No.", Rec."Document No.");
        CenterDispatchLines.SetRange("Line No.", Rec."Line No.");
        CenterDispatchLines.SetRange(Posted,true);
        if CenterDispatchLines.FindSet then begin
          Error('ERROR! This Paper has already been submitted');
          end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange("Document No.", Rec."Document No.");
        CenterDispatchLines.SetRange("Line No.", Rec."Line No.");
        CenterDispatchLines.SetRange(Posted,true);
        if CenterDispatchLines.FindSet then begin
          Error('ERROR! This Paper has already been submitted');
          end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange("Document No.", Rec."Document No.");
        CenterDispatchLines.SetRange("Line No.", Rec."Line No.");
        CenterDispatchLines.SetRange(Posted,true);
        if CenterDispatchLines.FindSet then begin
          Error('ERROR! This Paper has already been submitted');
          end;
    end;

    var
        CenterDispatchLines: Record "Center Dispatch Lines";
}

#pragma implicitwith restore

