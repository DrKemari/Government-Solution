#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70049 "Commitee"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Procurement Committee";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum Members"; Rec."Minimum Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Members field.';
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Type field.';
                }
                field("RFQ Same Openinng_ Evaluation"; Rec."RFQ Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFQ Same Openinng_ Evaluation field.';
                }
                field("RFP Same Openinng_ Evaluation"; Rec."RFP Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFP Same Openinng_ Evaluation field.';
                }
                field("Tend Same Openinng_ Evaluation"; Rec."Tend Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tend Same Openinng_ Evaluation field.';
                }
                field("Evaluation Opening"; Rec."Evaluation Opening")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Opening field.';
                }
                field("Evaluation Process"; Rec."Evaluation Process")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Process field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

