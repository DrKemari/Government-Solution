#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51263 "Proposal Documents Comments"
{
    CardPageID = "Proposal Document Comment";
    Editable = false;
    PageType = List;
    SourceTable = "Proposal Document Headr";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                }
                field("Campus No."; Rec."Campus No.")
                {
                    ApplicationArea = Basic;
                }
                field("Campus Name"; Rec."Campus Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                }
                field(Revision; Rec.Revision)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

