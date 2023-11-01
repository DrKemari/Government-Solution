#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51326 "Account Creation List"
{
    ApplicationArea = Basic;
    CardPageID = "Account Creation Card";
    InsertAllowed = false;
    PageType = List;
    SourceTable = Contact;
    SourceTableView = where(Type = filter(Company));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field("No."; Rec.CheckForExistingRelationships(); "No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                //     ApplicationArea = Basic;
                // }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the contact. If the contact is a person, you can click the field to see the Name Details window.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the contact''s address.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city where the contact is located.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the contact''s phone number.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the contact''s email.';
                }
            }
        }
    }

    actions
    {
    }

    var
        PeerPortal: Record Contact;
}

#pragma implicitwith restore

