#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69213 "HR Leave Types Card"
{
    PageType = Card;
    SourceTable = "HR Leave Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Posting Type"; Rec."Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days field.';
                    trigger OnValidate()
                    begin
                        Message(Format(SessionId));
                    end;
                }
                field("Attachment Mandatory"; Rec."Attachment Mandatory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Mandatory field.';
                }
                field("Acrue Days"; Rec."Acrue Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acrue Days field.';
                }
                field("Unlimited Days"; Rec."Unlimited Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unlimited Days field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Max Carry Forward Days"; Rec."Max Carry Forward Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Carry Forward Days field.';
                }
                field("Carry Forward Allowed"; Rec."Carry Forward Allowed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Carry Forward Allowed field.';
                }
                field("Inclusive of Non Working Days"; Rec."Inclusive of Non Working Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inclusive of Non Working Days field.';
                }
                field("Grace Period(in Days )"; Rec."Grace Period(in Days )")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grace Period(in Days ) field.';
                }
                field("Multiple Allocations"; Rec."Multiple Allocations")
                {
                    ApplicationArea = Basic;
                }
                field(Annual; Rec.Annual)
                {
                    ApplicationArea = Basic;
                }
                field("Detailed Description"; Rec."Detailed Description")
                {
                    ApplicationArea = Basic;
                }

            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

