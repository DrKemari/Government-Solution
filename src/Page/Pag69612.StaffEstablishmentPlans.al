#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69612 "Staff Establishment Plans"
{
    CardPageID = "Staff Establishment Plan";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Staff Establishment Plan";

    layout
    {
        area(content)
        {
            repeater(Group)
            { 
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                } 
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                } 
                field("Total Staff Establishment"; Rec."Total Staff Establishment")
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

