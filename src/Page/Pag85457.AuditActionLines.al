#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85457 "Audit Action Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Action Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Report No."; Rec."Audit Report No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Audit Report No. field.';
                }
                field("Audit Report Item"; Rec."Audit Report Item")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Audit Report Item field.';
                }
                field(Recommendation; Rec.Recommendation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Recommendation field.';
                }
                field("Action"; Rec.Action)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Actual Completion Date"; Rec."Actual Completion Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual Completion Date field.';
                }
                field("Completed By"; Rec."Completed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Completed By field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Complete Activity")
            {
                ApplicationArea = Basic;
                Image = CompleteLine;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Complete Activity action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure this activity is completed';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.Status := Rec.Status::Closed;
                        Rec."Actual Completion Date" := Today;
                        Rec."Completed By" := UserId;
                        Rec.Modify(true);
                    end
                end;
            }
        }
    }
}

#pragma implicitwith restore

