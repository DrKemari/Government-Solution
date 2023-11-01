#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72055 "Feasibility Study Teams"
{
    PageType = List;
    SourceTable = "Feasibility Study  Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Project Lead"; Rec."Project Lead")
                {
                    ApplicationArea = Basic;
                    Caption = 'Study Lead';
                    ToolTip = 'Specifies the value of the Study Lead field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        [InDataSet]
        Show: Boolean;
        editTransport: Boolean;
        ApprovalEntry: Record "Approval Entry";
        ImprestMemo: Record "Imprest Memo";
        EditDays: Boolean;
}

#pragma implicitwith restore

