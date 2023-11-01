#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56084 "Tracks Other Persons"
{
    PageType = List;
    SourceTable = "Track Other Persons";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Id Number"; Rec."Id Number")
                {
                    ApplicationArea = Basic;
                }
                field(Role; Rec.Role)
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

