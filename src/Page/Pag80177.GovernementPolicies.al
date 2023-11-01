#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80177 "Governement Policies"
{
    Caption = 'Governement Policies';
    CardPageID = "Government Policy Card";
    Editable = false;
    PageType = List;
    SourceTable = Policy;
    SourceTableView = where(Type = const(External),
                            "Approval Status" = const(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field(Summary; Rec.Summary)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summary field.';
                }
                field("Applies-To"; Rec."Applies-To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-To field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsible Person"; Rec."Responsible Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Person field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Date Approved"; Rec."Date Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Approved field.';
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Version No field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

