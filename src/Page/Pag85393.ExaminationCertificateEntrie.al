#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85393 "Examination Certificate Entrie"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Certificate Entry";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Student Reg No."; Rec."Student Reg No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Security Code"; Rec."Security Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Code field.';
                }
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Collected; Rec.Collected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected field.';
                }
                field("Collected By ID Number"; Rec."Collected By ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By ID Number field.';
                }
                field("Collected By Name"; Rec."Collected By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Name field.';
                }
                field("Collected By Email"; Rec."Collected By Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Email field.';
                }
                field("Issued  By"; Rec."Issued  By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued  By field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
                field("Issued Time"; Rec."Issued Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Time field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control18; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

