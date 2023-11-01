#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69014 "Loan Products Setup"
{
    Editable = true;
    RefreshOnActivate = true;
    SourceTable = "Loan Product Type";

    layout
    {
        area(content)
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
            field("Interest Rate"; Rec."Interest Rate")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interest Rate field.';
            }
            field("Interest Calculation Method"; Rec."Interest Calculation Method")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interest Calculation Method field.';
            }
            field("No Series"; Rec."No Series")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No Series field.';
            }
            field("No of Instalment"; Rec."No of Instalment")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No of Instalment field.';
            }
            field("Loan No Series"; Rec."Loan No Series")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Loan No Series field.';
            }
            field(Rounding; Rec.Rounding)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Rounding field.';
            }
            field("Rounding Precision"; Rec."Rounding Precision")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Rounding Precision field.';
            }
            field("Loan Category"; Rec."Loan Category")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Loan Category field.';
            }
            field("Calculate Interest"; Rec."Calculate Interest")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Calculate Interest field.';
            }
            field("Interest Deduction Code"; Rec."Interest Deduction Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interest Deduction Code field.';
            }
            field("Deduction Code"; Rec."Deduction Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Deduction Code field.';
            }
            field(Internal; Rec.Internal)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Internal field.';
            }
        }
    }

    actions
    {
    }

    var
        //WshShell: Automation WshShell;
}

#pragma implicitwith restore

