#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51294 "Completed Programmes"
{
    //CardPageID = "Completed Programme";
    Editable = false;
    PageType = List;
    SourceTable = "Acc Fee Schedules";
   // SourceTableView = where(Field22 = filter(6));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Service; Rec.Service)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Applies To New"; Rec."Applies To New")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies To New field.';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

