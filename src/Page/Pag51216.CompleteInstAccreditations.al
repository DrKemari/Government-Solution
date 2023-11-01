#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51216 "Complete Inst. Accreditations"
{
    CardPageID = "Complete Inst. Accreditation";
    PageType = List;
    SourceTable = "Ins. Accreditation Table";
    SourceTableView = where(Status = filter(Completed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation No. field.';
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No. field.';
                }
                field("Institution Name."; Rec."Institution Name.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name. field.';
                }
                field("Institution Campus"; Rec."Institution Campus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Campus field.';
                }
                field("Institution Phone No."; Rec."Institution Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Phone No. field.';
                }
                field("Received Amount"; Rec."Received Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

