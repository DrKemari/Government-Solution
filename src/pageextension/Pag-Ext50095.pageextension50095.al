#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50095 "pageextension50095" extends "Employee Qualifications" 
{
    layout
    {
        addfirst(Control1)
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
            }
            field("Qualification Category"; Rec."Qualification Category")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Cost)
        {
            field(Year; Rec.Year)
            {
                ApplicationArea = Basic;
            }
            field(Specialization; Rec.Specialization)
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Qualification Code";Description)
        moveafter(Description;"Institution/Company")
    }
}

#pragma implicitwith restore

