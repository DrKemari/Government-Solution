#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51521 "Subject Area Contact Hrs"
{
    PageType = ListPart;
    SourceTable = "Subject Area Contact Hrs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Subject Area"; Rec."Subject Area")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Hours"; Rec."Contact Hours")
                {
                    ApplicationArea = Basic;
                }
                field("Course Unit"; Rec."Course Unit")
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

