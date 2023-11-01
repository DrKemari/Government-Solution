#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55007 "Agenda Vote Items"
{
    Editable = true;
    PageType = List;
    SourceTable = "Agenda vote items";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field("Meeting No"; Rec."Meeting No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting No field.';
                }
                field("Agenda No"; Rec."Agenda No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda No field.';
                    trigger OnValidate()
                    begin
                        MeetingAgenda.Reset;
                        MeetingAgenda.SetRange("Agenda code", Rec."Agenda No");
                        if MeetingAgenda.FindSet then
                            Rec.Description := MeetingAgenda.Description;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Yes Count"; Rec."Yes Count")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Yes Count field.';
                }
                field("No Count"; Rec."No Count")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No Count field.';
                }
                field("Abstain Count"; Rec."Abstain Count")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Abstain Count field.';
                }
                field("Total Votes"; Rec."Total Votes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Votes field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Vote start Date"; Rec."Vote start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote start Date field.';
                }
                field("Vote start Time"; Rec."Vote start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote start Time field.';
                }
                field("Vote Enda date"; Rec."Vote Enda date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Enda date field.';
                }
                field("Vote Enda Time"; Rec."Vote Enda Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Enda Time field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        MeetingAgenda: Record "Meeting Agenda";
}

#pragma implicitwith restore

