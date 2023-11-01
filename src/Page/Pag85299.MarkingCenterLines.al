#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85299 "Marking Center Lines"
{
    PageType = ListPart;
    SourceTable = "Marker Checklist  Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Script Returned"; Rec."Script Returned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Script Returned field.';
                }
                field("Attendance Register"; Rec."Attendance Register")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attendance Register field.';
                }
                field("Signature Register"; Rec."Signature Register")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Signature Register field.';
                }
                field("Invigilators Reports"; Rec."Invigilators Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invigilators Reports field.';
                }
                field("Payment Summary Form"; Rec."Payment Summary Form")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Summary Form field.';
                }
                field("Daily Attendance Register"; Rec."Daily Attendance Register")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Attendance Register field.';
                }
                field("Sitting Plan"; Rec."Sitting Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Plan field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

