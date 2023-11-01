#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72096 "Detection & Rectification Line"
{
    PageType = ListPart;
    SourceTable = "Detection & Rectification Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Date Detected"; Rec."Date Detected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Detected field.';
                }
                field("Location Deteced From"; Rec."Location Deteced From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Deteced From field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date Rectified"; Rec."Date Rectified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Rectified field.';
                }
                field("Complied?"; Rec."Complied?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complied? field.';
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

