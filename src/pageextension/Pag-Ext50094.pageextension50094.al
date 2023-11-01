#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50094 "pageextension50094" extends Qualifications 
{
    layout
    {
        addafter(Description)
        {
            field("Qualification Category"; Rec."Qualification Category")
            {
                ApplicationArea = Basic;
            }
            field("Academic Hierachy Code"; Rec."Academic Hierachy Code")
            {
                ApplicationArea = Basic;
            }
            field("No. of Active Employees"; Rec."No. of Active Employees")
            {
                ApplicationArea = Basic;
            }
            field("No. of Qualified Applicants"; Rec."No. of Qualified Applicants")
            {
                ApplicationArea = Basic;
            }
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

