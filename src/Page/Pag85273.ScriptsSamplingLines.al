#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85273 "Scripts Sampling Lines"
{
    PageType = ListPart;
    SourceTable = "Scripts Sampling Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Marker No"; Rec."Marker No")
                {
                    ApplicationArea = Basic;
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field("Sample Script No"; Rec."Sample Script No")
                {
                    ApplicationArea = Basic;
                }
                field("Marker Score"; Rec."Marker Score")
                {
                    ApplicationArea = Basic;
                }
                field("Team Leader Score"; Rec."Team Leader Score")
                {
                    ApplicationArea = Basic;
                }
                field(Variance; Rec.Variance)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cause of Variance"; Rec."Cause of Variance")
                {
                    ApplicationArea = Basic;
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

