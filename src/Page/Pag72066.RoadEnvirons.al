#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72066 "Road Environs"
{
    PageType = List;
    SourceTable = "Road Environs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Environ ID"; Rec."Environ ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Environ Catgegory"; Rec."Road Environ Catgegory")
                {
                    ApplicationArea = Basic;
                }
                field("Road Envrion Type"; Rec."Road Envrion Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Distance(Km) From Road Link"; Rec."Distance(Km) From Road Link")
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

