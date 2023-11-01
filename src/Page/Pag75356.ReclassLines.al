#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75356 "Reclass Lines"
{
    PageType = ListPart;
    SourceTable = "FA Reclass Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reclass. Acq Amount"; Rec."Reclass. Acq Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
           FAReclassificationHeader.Reset;
           FAReclassificationHeader.SetRange("No.", Rec."Header No.");
           if FAReclassificationHeader.Find ('-') then begin
            Rec."FA SubClass" := FAReclassificationHeader."FA SubClass";
            Rec.Modify;
           end;
    end;

    var
        FAReclassificationHeader: Record "FA Reclassification Header";
}

#pragma implicitwith restore

