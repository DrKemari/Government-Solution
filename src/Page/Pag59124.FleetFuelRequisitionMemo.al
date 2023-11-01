#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59124 "Fleet Fuel Requisition Memo"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Fuel Travel Requisition";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Type field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job Task"; Rec."Job Task")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Amount field.';
                    trigger OnValidate()
                    begin
                        if ImprestMemo.Get(Rec."Req No") then begin
                            Rec."Job Name" := ImprestMemo."Job Name";
                            Rec."Job No" := ImprestMemo.Job;
                            Rec."Job Task" := ImprestMemo."Job  Task";
                            Rec."Job Task Name" := ImprestMemo."Job Task Name";
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    var
        ImprestMemo: Record "Imprest Memo";
}

#pragma implicitwith restore

