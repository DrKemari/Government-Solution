#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70112 "Disposal Bidders"
{
    PageType = List;
    SourceTable = "Disposal Bidders";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                //   Editable = Editable;
                field("Disposal No."; Rec."Disposal No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Disposal No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Address field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Person field.';
                }
                field("Physical Addess"; Rec."Physical Addess")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical Addess field.';
                }
                field(Award; Rec.Award)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award field.';
                    // trigger OnValidate()
                    // begin
                    //     DisposalBidders.Reset;
                    //     DisposalBidders.SetRange("Disposal No.", Rec."Disposal No.");
                    //     DisposalBidders.SetRange(Award, true);
                    //     if DisposalBidders.FindFirst then
                    //         if DisposalBidders.Count = 1 then
                    //             AwardEditable := false;
                    // end;
                }
            }
        }
    }

}
#pragma implicitwith restore
