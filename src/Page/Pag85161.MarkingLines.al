#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85161 "Marking Lines"
{
    PageType = ListPart;
    SourceTable = "Marking Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("Total Candidature"; Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Candidature field.';
                }
                field("No. of Markers"; Rec."No. of Markers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Markers field.';
                }
                field("No. of Team Leaders"; Rec."No. of Team Leaders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Team Leaders field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Image = ResourcePlanning;
                action("Appointed External  Staff")
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    RunObject = Page "Exam Appointment Voucher";
                    RunPageLink = Examination = field(Examination),
                                  MarkCenterDocNo = field("Document No.");
                    ToolTip = 'Executes the Appointed External  Staff action.';
                }
                action("Appointed Internal Staff")
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    RunObject = Page "Int Exam Appointment Voucher";
                    RunPageLink = Examination = field(Examination);
                    ToolTip = 'Executes the Appointed Internal Staff action.';
                }
                action("Key Dates")
                {
                    ApplicationArea = Basic;
                    Image = DateRange;
                    Promoted = true;
                    RunObject = Page "Marking Key Dates";
                    RunPageLink = Examination = field(Examination),
                                  "Document No." = field("Document No.");
                    ToolTip = 'Executes the Key Dates action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

