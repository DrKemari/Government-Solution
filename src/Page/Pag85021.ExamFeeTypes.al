#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85021 "Exam Fee Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Resource;
    //SourceTableView = where(Type = filter(Panelist));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the resource.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field("Exam Booking Category"; Rec."Exam Booking Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Booking Category field.';
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Course';
                    ToolTip = 'Specifies the value of the Course field.';
                }
                field("Part ID"; Rec."Part ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Part';
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section';
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field("Paper ID"; Rec."Paper ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Paper';
                    ToolTip = 'Specifies the value of the Paper field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
       // Type := Type::Panelist;
    end;
}

#pragma implicitwith restore

