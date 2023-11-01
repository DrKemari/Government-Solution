#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69333 "Applicant Accomplishment"
{
    PageType = List;
    SourceTable = "Applicant Competency";
    SourceTableView = where("Qualification Type" = const(Awards));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Domain Area"; Rec."Domain Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Domain Area field.';
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Name field.';
                }
                field("Start Year"; Rec."Start Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Year field.';
                }
                field("End Year"; Rec."End Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Year field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Qualification Type" := Rec."qualification type"::Awards;
    end;

    trigger OnOpenPage()
    begin
        Rec."Qualification Type" := Rec."qualification type"::Awards;
    end;
}

#pragma implicitwith restore

