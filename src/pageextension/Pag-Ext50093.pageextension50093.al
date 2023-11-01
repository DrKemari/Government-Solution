#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50093 "pageextension50093" extends "Employee List" 
{
    layout
    {
        modify("No.")
        {
            Caption = 'Personal No.';
        }
        addafter("Job Title")
        {
            field(Supervisor; Rec.Supervisor)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

