#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51275 "Proposed Peer Reviewers"
{
    PageType = ListPart;
    SourceTable = "Audit Mobilization Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Commencement Notice No."; Rec."Audit Commencement Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Notice Response No."; Rec."Auditee Notice Response No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
     //   "Engagement ID":="engagement id"::"1";
    end;

    trigger OnOpenPage()
    begin
      //  "Engagement ID":="engagement id"::"1";
    end;
}

#pragma implicitwith restore

